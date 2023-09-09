package org.jl.bastion.cache.model

import io.micronaut.serde.annotation.Serdeable

@Serdeable
data class UserInfo (
    val sub: String,
    val cip: String,
    val tlf: String
)