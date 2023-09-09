package org.jl.bastion.patient.service

import jakarta.inject.Singleton
import org.jl.bastion.patient.model.ClinicalRecord
import org.jl.bastion.patient.model.UserInfo
import org.slf4j.LoggerFactory

@Singleton
class ClinicalRecordService {

    private val logger = LoggerFactory.getLogger(ClinicalRecordService::class.java)
    private val mock = HashMap<String, ClinicalRecord>()

    init {
        mock["AAAA1111111111"] = ClinicalRecord("AAAA1111111111", "Clinical document for user1, tlf: %s")
        mock["BBBB2222222222"] = ClinicalRecord("BBBB2222222222", "Clinical document for user2, tlf: %s")
    }

    fun getPatientClinicalRecord(userInfo: UserInfo): ClinicalRecord? {

        logger.info("Getting ClinicalRecord for user cip: '{}'", userInfo.cip)
        val record = mock[userInfo.cip];
        if (record != null) {
            return ClinicalRecord(record.patientCip, String.format(record.document, userInfo.tlf))
        }
        return null
    }
}