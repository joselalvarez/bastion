package org.jl.bastion.patient.model

import io.micronaut.serde.annotation.Serdeable

@Serdeable
data class ClinicalRecord (val patientCip: String, var document: String)