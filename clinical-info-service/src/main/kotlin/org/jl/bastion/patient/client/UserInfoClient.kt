package org.jl.bastion.patient.client

import io.micronaut.http.HttpHeaders
import io.micronaut.http.HttpResponse
import io.micronaut.http.annotation.Get
import io.micronaut.http.annotation.Header
import io.micronaut.http.annotation.Headers
import io.micronaut.http.client.annotation.Client
import org.jl.bastion.patient.model.UserInfo

@Client("\${userinfo.address}")
@Headers(
    Header(name = HttpHeaders.USER_AGENT, value = "Micronaut HTTP Client"),
    Header(name = HttpHeaders.ACCEPT, value = "application/json")
)
interface UserInfoClient {
    @Get("/realms/\${userinfo.realm}/protocol/openid-connect/userinfo")
    fun getInfo(@Header(name = HttpHeaders.AUTHORIZATION) authorization: String): HttpResponse<UserInfo?>
}