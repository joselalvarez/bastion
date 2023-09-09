package org.jl.bastion.patient.controller

import io.micronaut.http.HttpResponse
import io.micronaut.http.HttpStatus
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get
import io.micronaut.http.annotation.Header
import io.micronaut.security.annotation.Secured
import io.micronaut.security.authentication.Authentication
import io.micronaut.security.rules.SecurityRule
import org.infinispan.client.hotrod.RemoteCache
import org.jl.bastion.patient.config.RemoteCacheFactory
import org.jl.bastion.patient.model.ClinicalRecord
import org.jl.bastion.patient.service.ClinicalRecordService
import org.jl.bastion.patient.service.UserInfoService
import org.slf4j.LoggerFactory

@Controller("/clinical-record")
class ClinicalRecordController (
    private val userInfoService: UserInfoService,
    private val clinicalRecordService: ClinicalRecordService,
    private val remoteCacheFactory: RemoteCacheFactory) {

    private val logger = LoggerFactory.getLogger(ClinicalRecordController::class.java)
    @Get
    @Secured(SecurityRule.IS_AUTHENTICATED)
    fun getRecord(@Header("Authorization") authorization: String, auth: Authentication): HttpResponse<ClinicalRecord> {
        logger.info("Getting Clinical Record for Authorization")
        remoteCacheFactory.getUserInfoRemoteCache()
        if (auth.attributes.containsKey("sub")) {
            val userInfo = userInfoService.getInfo(auth.attributes["sub"].toString(), authorization)
            if (userInfo != null) {
                val record = clinicalRecordService.getPatientClinicalRecord(userInfo)
                if (record != null) {
                    logger.info("Clinical Record found: '{}'", record.document)
                    return HttpResponse.ok(record)
                }
            }
        }
        logger.warn("Clinical Record not found!")
        return HttpResponse.status(HttpStatus.NOT_FOUND)
    }
}