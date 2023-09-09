{
  "id" : "b9851836-4c94-4647-9fb1-0010d152c773",
  "realm" : "bastion",
  "notBefore" : 0,
  "defaultSignatureAlgorithm" : "RS256",
  "revokeRefreshToken" : false,
  "refreshTokenMaxReuse" : 0,
  "accessTokenLifespan" : 300,
  "accessTokenLifespanForImplicitFlow" : 900,
  "ssoSessionIdleTimeout" : 1800,
  "ssoSessionMaxLifespan" : 36000,
  "ssoSessionIdleTimeoutRememberMe" : 0,
  "ssoSessionMaxLifespanRememberMe" : 0,
  "offlineSessionIdleTimeout" : 2592000,
  "offlineSessionMaxLifespanEnabled" : false,
  "offlineSessionMaxLifespan" : 5184000,
  "clientSessionIdleTimeout" : 0,
  "clientSessionMaxLifespan" : 0,
  "clientOfflineSessionIdleTimeout" : 0,
  "clientOfflineSessionMaxLifespan" : 0,
  "accessCodeLifespan" : 60,
  "accessCodeLifespanUserAction" : 300,
  "accessCodeLifespanLogin" : 1800,
  "actionTokenGeneratedByAdminLifespan" : 43200,
  "actionTokenGeneratedByUserLifespan" : 300,
  "oauth2DeviceCodeLifespan" : 600,
  "oauth2DevicePollingInterval" : 5,
  "enabled" : true,
  "sslRequired" : "external",
  "registrationAllowed" : false,
  "registrationEmailAsUsername" : false,
  "rememberMe" : false,
  "verifyEmail" : false,
  "loginWithEmailAllowed" : true,
  "duplicateEmailsAllowed" : false,
  "resetPasswordAllowed" : false,
  "editUsernameAllowed" : false,
  "bruteForceProtected" : false,
  "permanentLockout" : false,
  "maxFailureWaitSeconds" : 900,
  "minimumQuickLoginWaitSeconds" : 60,
  "waitIncrementSeconds" : 60,
  "quickLoginCheckMilliSeconds" : 1000,
  "maxDeltaTimeSeconds" : 43200,
  "failureFactor" : 30,
  "roles" : {
    "realm" : [ {
      "id" : "e7bb2dcc-e2bb-4971-841c-295aec949ab6",
      "name" : "default-roles-bastion",
      "description" : "${role_default-roles}",
      "composite" : true,
      "composites" : {
        "realm" : [ "offline_access", "uma_authorization" ],
        "client" : {
          "account" : [ "view-profile", "manage-account" ]
        }
      },
      "clientRole" : false,
      "containerId" : "b9851836-4c94-4647-9fb1-0010d152c773",
      "attributes" : { }
    }, {
      "id" : "ffba02f5-451d-4853-bfeb-ee1b9ebd08e9",
      "name" : "uma_authorization",
      "description" : "${role_uma_authorization}",
      "composite" : false,
      "clientRole" : false,
      "containerId" : "b9851836-4c94-4647-9fb1-0010d152c773",
      "attributes" : { }
    }, {
      "id" : "ea6582c7-58a4-4867-8418-33a58fe7bd41",
      "name" : "offline_access",
      "description" : "${role_offline-access}",
      "composite" : false,
      "clientRole" : false,
      "containerId" : "b9851836-4c94-4647-9fb1-0010d152c773",
      "attributes" : { }
    } ],
    "client" : {
      "realm-management" : [ {
        "id" : "60200382-937c-44dd-8a46-16171e4eef24",
        "name" : "realm-admin",
        "description" : "${role_realm-admin}",
        "composite" : true,
        "composites" : {
          "client" : {
            "realm-management" : [ "query-users", "impersonation", "manage-realm", "query-groups", "manage-events", "view-realm", "view-authorization", "view-identity-providers", "create-client", "manage-users", "query-realms", "manage-identity-providers", "view-events", "view-users", "view-clients", "query-clients", "manage-authorization", "manage-clients" ]
          }
        },
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "a0c570ff-8730-46cd-a9d3-2f8fd8b956db",
        "name" : "impersonation",
        "description" : "${role_impersonation}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "0df6d8b3-63e2-4bd2-a9f0-2d6c5d32597f",
        "name" : "query-users",
        "description" : "${role_query-users}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "e6d89269-2af2-43de-b0f3-c6e45e77efc9",
        "name" : "manage-realm",
        "description" : "${role_manage-realm}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "8385796c-98e5-4d1f-9a57-9e43227d52bd",
        "name" : "query-groups",
        "description" : "${role_query-groups}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "0beac3c1-f0df-458b-94d6-7fd2bb68fd41",
        "name" : "manage-events",
        "description" : "${role_manage-events}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "d3f53745-6a4f-413b-ae34-4976cba18f54",
        "name" : "view-realm",
        "description" : "${role_view-realm}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "17645a86-32ac-40aa-a174-c242ec3749cb",
        "name" : "view-authorization",
        "description" : "${role_view-authorization}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "f9bc929f-f252-4e4e-a690-87abb9576be8",
        "name" : "view-identity-providers",
        "description" : "${role_view-identity-providers}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "b70b41b6-fdf0-4d28-941f-3185aa7b3d7a",
        "name" : "create-client",
        "description" : "${role_create-client}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "207090ae-3d8c-4de4-8434-a4dfe1cd5b2e",
        "name" : "manage-users",
        "description" : "${role_manage-users}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "cfb232bc-d5be-4f02-8571-8b9adeb1df3b",
        "name" : "manage-identity-providers",
        "description" : "${role_manage-identity-providers}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "c3a1cbc8-c8dd-42c4-95f1-6a82a9e1cc53",
        "name" : "query-realms",
        "description" : "${role_query-realms}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "6de79246-f54f-4288-bed4-2eee96902b57",
        "name" : "view-events",
        "description" : "${role_view-events}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "cb0ef831-2873-4a40-a90a-0521892695e6",
        "name" : "view-clients",
        "description" : "${role_view-clients}",
        "composite" : true,
        "composites" : {
          "client" : {
            "realm-management" : [ "query-clients" ]
          }
        },
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "1f1e0aa8-2a38-4f45-9045-d1c46a2da8ac",
        "name" : "view-users",
        "description" : "${role_view-users}",
        "composite" : true,
        "composites" : {
          "client" : {
            "realm-management" : [ "query-users", "query-groups" ]
          }
        },
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "43cc142e-0781-4494-80c6-387f122763ad",
        "name" : "query-clients",
        "description" : "${role_query-clients}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "53fe29fd-90a9-4524-874f-aac218b27d34",
        "name" : "manage-authorization",
        "description" : "${role_manage-authorization}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      }, {
        "id" : "fb6a9189-3ce1-4104-836d-ccf72b7f94fe",
        "name" : "manage-clients",
        "description" : "${role_manage-clients}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
        "attributes" : { }
      } ],
      "security-admin-console" : [ ],
      "admin-cli" : [ ],
      "bastion-cli" : [ ],
      "account-console" : [ ],
      "broker" : [ {
        "id" : "ee4a9625-9f47-4835-a5aa-27a5ea55fca1",
        "name" : "read-token",
        "description" : "${role_read-token}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "865280a8-740d-4e8b-aa21-3a185161aa11",
        "attributes" : { }
      } ],
      "account" : [ {
        "id" : "c9609fe3-6914-4d2e-a466-6bc8eeddcbcd",
        "name" : "view-profile",
        "description" : "${role_view-profile}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e93a44ff-dd0b-4a82-8d47-5108f325cb92",
        "attributes" : { }
      }, {
        "id" : "ae3bed87-556b-4054-8535-74b3405f8667",
        "name" : "delete-account",
        "description" : "${role_delete-account}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e93a44ff-dd0b-4a82-8d47-5108f325cb92",
        "attributes" : { }
      }, {
        "id" : "73c3b4a2-6247-4099-abfa-d46b721d891f",
        "name" : "manage-account",
        "description" : "${role_manage-account}",
        "composite" : true,
        "composites" : {
          "client" : {
            "account" : [ "manage-account-links" ]
          }
        },
        "clientRole" : true,
        "containerId" : "e93a44ff-dd0b-4a82-8d47-5108f325cb92",
        "attributes" : { }
      }, {
        "id" : "0fc3f0d8-dec6-41f4-8c15-2332c9566b9c",
        "name" : "manage-consent",
        "description" : "${role_manage-consent}",
        "composite" : true,
        "composites" : {
          "client" : {
            "account" : [ "view-consent" ]
          }
        },
        "clientRole" : true,
        "containerId" : "e93a44ff-dd0b-4a82-8d47-5108f325cb92",
        "attributes" : { }
      }, {
        "id" : "0a35be6e-9548-4ff2-95cf-abaffdcc2f20",
        "name" : "view-consent",
        "description" : "${role_view-consent}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e93a44ff-dd0b-4a82-8d47-5108f325cb92",
        "attributes" : { }
      }, {
        "id" : "bebb3204-3bae-4d9a-8056-9d0cdb2ef7d3",
        "name" : "manage-account-links",
        "description" : "${role_manage-account-links}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e93a44ff-dd0b-4a82-8d47-5108f325cb92",
        "attributes" : { }
      }, {
        "id" : "3696e549-73aa-4e1f-a645-c79f526aa77d",
        "name" : "view-applications",
        "description" : "${role_view-applications}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e93a44ff-dd0b-4a82-8d47-5108f325cb92",
        "attributes" : { }
      }, {
        "id" : "5d4900f3-d872-4be3-8e4f-c933dcbe33e7",
        "name" : "view-groups",
        "description" : "${role_view-groups}",
        "composite" : false,
        "clientRole" : true,
        "containerId" : "e93a44ff-dd0b-4a82-8d47-5108f325cb92",
        "attributes" : { }
      } ]
    }
  },
  "groups" : [ ],
  "defaultRole" : {
    "id" : "e7bb2dcc-e2bb-4971-841c-295aec949ab6",
    "name" : "default-roles-bastion",
    "description" : "${role_default-roles}",
    "composite" : true,
    "clientRole" : false,
    "containerId" : "b9851836-4c94-4647-9fb1-0010d152c773"
  },
  "requiredCredentials" : [ "password" ],
  "otpPolicyType" : "totp",
  "otpPolicyAlgorithm" : "HmacSHA1",
  "otpPolicyInitialCounter" : 0,
  "otpPolicyDigits" : 6,
  "otpPolicyLookAheadWindow" : 1,
  "otpPolicyPeriod" : 30,
  "otpPolicyCodeReusable" : false,
  "otpSupportedApplications" : [ "totpAppFreeOTPName", "totpAppGoogleName", "totpAppMicrosoftAuthenticatorName" ],
  "webAuthnPolicyRpEntityName" : "keycloak",
  "webAuthnPolicySignatureAlgorithms" : [ "ES256" ],
  "webAuthnPolicyRpId" : "",
  "webAuthnPolicyAttestationConveyancePreference" : "not specified",
  "webAuthnPolicyAuthenticatorAttachment" : "not specified",
  "webAuthnPolicyRequireResidentKey" : "not specified",
  "webAuthnPolicyUserVerificationRequirement" : "not specified",
  "webAuthnPolicyCreateTimeout" : 0,
  "webAuthnPolicyAvoidSameAuthenticatorRegister" : false,
  "webAuthnPolicyAcceptableAaguids" : [ ],
  "webAuthnPolicyPasswordlessRpEntityName" : "keycloak",
  "webAuthnPolicyPasswordlessSignatureAlgorithms" : [ "ES256" ],
  "webAuthnPolicyPasswordlessRpId" : "",
  "webAuthnPolicyPasswordlessAttestationConveyancePreference" : "not specified",
  "webAuthnPolicyPasswordlessAuthenticatorAttachment" : "not specified",
  "webAuthnPolicyPasswordlessRequireResidentKey" : "not specified",
  "webAuthnPolicyPasswordlessUserVerificationRequirement" : "not specified",
  "webAuthnPolicyPasswordlessCreateTimeout" : 0,
  "webAuthnPolicyPasswordlessAvoidSameAuthenticatorRegister" : false,
  "webAuthnPolicyPasswordlessAcceptableAaguids" : [ ],
  "users" : [ {
    "id" : "dbfcd8d1-f119-4c89-9409-544382abb11b",
    "createdTimestamp" : 1693669853579,
    "username" : "user1",
    "enabled" : true,
    "totp" : false,
    "emailVerified" : false,
    "attributes" : {
      "tlf" : [ "600000001" ],
      "cip" : [ "AAAA1111111111" ]
    },
    "credentials" : [ {
      "id" : "f84d4392-880e-4eeb-ad16-d636d30f58f7",
      "type" : "password",
      "createdDate" : 1693669854698,
      "secretData" : "{\"value\":\"3Z83Ic8JUztntTF9PBmLJW02MIxLxTYPg2mt5N2TgwA=\",\"salt\":\"8qeAg8keMTB9ctgwRYBQ8w==\",\"additionalParameters\":{}}",
      "credentialData" : "{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}"
    } ],
    "disableableCredentialTypes" : [ ],
    "requiredActions" : [ ],
    "realmRoles" : [ "default-roles-bastion" ],
    "notBefore" : 0,
    "groups" : [ ]
  }, {
    "id" : "1c79fac4-20d6-44ff-a4bf-dee2020648ea",
    "createdTimestamp" : 1693669855640,
    "username" : "user2",
    "enabled" : true,
    "totp" : false,
    "emailVerified" : false,
    "attributes" : {
      "tlf" : [ "600000002" ],
      "cip" : [ "BBBB2222222222" ]
    },
    "credentials" : [ {
      "id" : "c238e9d7-4530-4bc3-a2f2-99081a9c100f",
      "type" : "password",
      "createdDate" : 1693669856610,
      "secretData" : "{\"value\":\"WoZMVXTPO4THm8Nb4gQAk+d+FhUl1TPLEsu3S8xqz6M=\",\"salt\":\"lJozygA9qOPL0IYdUAidSw==\",\"additionalParameters\":{}}",
      "credentialData" : "{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}"
    } ],
    "disableableCredentialTypes" : [ ],
    "requiredActions" : [ ],
    "realmRoles" : [ "default-roles-bastion" ],
    "notBefore" : 0,
    "groups" : [ ]
  } ],
  "scopeMappings" : [ {
    "clientScope" : "offline_access",
    "roles" : [ "offline_access" ]
  } ],
  "clientScopeMappings" : {
    "account" : [ {
      "client" : "account-console",
      "roles" : [ "manage-account", "view-groups" ]
    } ]
  },
  "clients" : [ {
    "id" : "e93a44ff-dd0b-4a82-8d47-5108f325cb92",
    "clientId" : "account",
    "name" : "${client_account}",
    "rootUrl" : "${authBaseUrl}",
    "baseUrl" : "/realms/bastion/account/",
    "surrogateAuthRequired" : false,
    "enabled" : true,
    "alwaysDisplayInConsole" : false,
    "clientAuthenticatorType" : "client-secret",
    "redirectUris" : [ "/realms/bastion/account/*" ],
    "webOrigins" : [ ],
    "notBefore" : 0,
    "bearerOnly" : false,
    "consentRequired" : false,
    "standardFlowEnabled" : true,
    "implicitFlowEnabled" : false,
    "directAccessGrantsEnabled" : false,
    "serviceAccountsEnabled" : false,
    "publicClient" : true,
    "frontchannelLogout" : false,
    "protocol" : "openid-connect",
    "attributes" : {
      "post.logout.redirect.uris" : "+"
    },
    "authenticationFlowBindingOverrides" : { },
    "fullScopeAllowed" : false,
    "nodeReRegistrationTimeout" : 0,
    "defaultClientScopes" : [ "web-origins", "acr", "profile", "roles", "email" ],
    "optionalClientScopes" : [ "address", "phone", "offline_access", "microprofile-jwt" ]
  }, {
    "id" : "6e169f7d-0562-46ed-802f-84441304b7ad",
    "clientId" : "account-console",
    "name" : "${client_account-console}",
    "rootUrl" : "${authBaseUrl}",
    "baseUrl" : "/realms/bastion/account/",
    "surrogateAuthRequired" : false,
    "enabled" : true,
    "alwaysDisplayInConsole" : false,
    "clientAuthenticatorType" : "client-secret",
    "redirectUris" : [ "/realms/bastion/account/*" ],
    "webOrigins" : [ ],
    "notBefore" : 0,
    "bearerOnly" : false,
    "consentRequired" : false,
    "standardFlowEnabled" : true,
    "implicitFlowEnabled" : false,
    "directAccessGrantsEnabled" : false,
    "serviceAccountsEnabled" : false,
    "publicClient" : true,
    "frontchannelLogout" : false,
    "protocol" : "openid-connect",
    "attributes" : {
      "post.logout.redirect.uris" : "+",
      "pkce.code.challenge.method" : "S256"
    },
    "authenticationFlowBindingOverrides" : { },
    "fullScopeAllowed" : false,
    "nodeReRegistrationTimeout" : 0,
    "protocolMappers" : [ {
      "id" : "71697993-cac6-4c0e-ab5e-e1da82a052c8",
      "name" : "audience resolve",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-audience-resolve-mapper",
      "consentRequired" : false,
      "config" : { }
    } ],
    "defaultClientScopes" : [ "web-origins", "acr", "profile", "roles", "email" ],
    "optionalClientScopes" : [ "address", "phone", "offline_access", "microprofile-jwt" ]
  }, {
    "id" : "6af1edb3-910a-4643-81a0-97f3b950e43f",
    "clientId" : "admin-cli",
    "name" : "${client_admin-cli}",
    "surrogateAuthRequired" : false,
    "enabled" : true,
    "alwaysDisplayInConsole" : false,
    "clientAuthenticatorType" : "client-secret",
    "redirectUris" : [ ],
    "webOrigins" : [ ],
    "notBefore" : 0,
    "bearerOnly" : false,
    "consentRequired" : false,
    "standardFlowEnabled" : false,
    "implicitFlowEnabled" : false,
    "directAccessGrantsEnabled" : true,
    "serviceAccountsEnabled" : false,
    "publicClient" : true,
    "frontchannelLogout" : false,
    "protocol" : "openid-connect",
    "attributes" : {
      "post.logout.redirect.uris" : "+"
    },
    "authenticationFlowBindingOverrides" : { },
    "fullScopeAllowed" : false,
    "nodeReRegistrationTimeout" : 0,
    "defaultClientScopes" : [ "web-origins", "acr", "profile", "roles", "email" ],
    "optionalClientScopes" : [ "address", "phone", "offline_access", "microprofile-jwt" ]
  }, {
    "id" : "42ba3ef6-3241-4f1d-9257-87be369ac9d1",
    "clientId" : "bastion-cli",
    "surrogateAuthRequired" : false,
    "enabled" : true,
    "alwaysDisplayInConsole" : false,
    "clientAuthenticatorType" : "client-secret",
    "secret" : "{{ env "BASTION_CLIENT_SECRET" }}",
    "redirectUris" : [ "*" ],
    "webOrigins" : [ ],
    "notBefore" : 0,
    "bearerOnly" : false,
    "consentRequired" : false,
    "standardFlowEnabled" : true,
    "implicitFlowEnabled" : false,
    "directAccessGrantsEnabled" : false,
    "serviceAccountsEnabled" : false,
    "publicClient" : false,
    "frontchannelLogout" : false,
    "protocol" : "openid-connect",
    "attributes" : {
      "post.logout.redirect.uris" : "+"
    },
    "authenticationFlowBindingOverrides" : { },
    "fullScopeAllowed" : true,
    "nodeReRegistrationTimeout" : -1,
    "protocolMappers" : [ {
      "id" : "9610b11d-81be-42ca-9f85-a4d0669560e9",
      "name" : "cip-mapper",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "cip",
        "id.token.claim" : "false",
        "access.token.claim" : "false",
        "claim.name" : "cip",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "02f1c000-28dc-46fd-ad39-325fad89d1cd",
      "name" : "tlf-mapper",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "tlf",
        "id.token.claim" : "false",
        "access.token.claim" : "false",
        "claim.name" : "tlf",
        "jsonType.label" : "String"
      }
    } ],
    "defaultClientScopes" : [ ],
    "optionalClientScopes" : [ "address", "phone", "offline_access", "microprofile-jwt", "web-origins", "acr", "profile", "roles", "email" ]
  }, {
    "id" : "865280a8-740d-4e8b-aa21-3a185161aa11",
    "clientId" : "broker",
    "name" : "${client_broker}",
    "surrogateAuthRequired" : false,
    "enabled" : true,
    "alwaysDisplayInConsole" : false,
    "clientAuthenticatorType" : "client-secret",
    "redirectUris" : [ ],
    "webOrigins" : [ ],
    "notBefore" : 0,
    "bearerOnly" : true,
    "consentRequired" : false,
    "standardFlowEnabled" : true,
    "implicitFlowEnabled" : false,
    "directAccessGrantsEnabled" : false,
    "serviceAccountsEnabled" : false,
    "publicClient" : false,
    "frontchannelLogout" : false,
    "protocol" : "openid-connect",
    "attributes" : {
      "post.logout.redirect.uris" : "+"
    },
    "authenticationFlowBindingOverrides" : { },
    "fullScopeAllowed" : false,
    "nodeReRegistrationTimeout" : 0,
    "defaultClientScopes" : [ "web-origins", "acr", "profile", "roles", "email" ],
    "optionalClientScopes" : [ "address", "phone", "offline_access", "microprofile-jwt" ]
  }, {
    "id" : "e539aee7-e37e-400f-9020-e97c1e7e63d3",
    "clientId" : "realm-management",
    "name" : "${client_realm-management}",
    "surrogateAuthRequired" : false,
    "enabled" : true,
    "alwaysDisplayInConsole" : false,
    "clientAuthenticatorType" : "client-secret",
    "redirectUris" : [ ],
    "webOrigins" : [ ],
    "notBefore" : 0,
    "bearerOnly" : true,
    "consentRequired" : false,
    "standardFlowEnabled" : true,
    "implicitFlowEnabled" : false,
    "directAccessGrantsEnabled" : false,
    "serviceAccountsEnabled" : false,
    "publicClient" : false,
    "frontchannelLogout" : false,
    "protocol" : "openid-connect",
    "attributes" : {
      "post.logout.redirect.uris" : "+"
    },
    "authenticationFlowBindingOverrides" : { },
    "fullScopeAllowed" : false,
    "nodeReRegistrationTimeout" : 0,
    "defaultClientScopes" : [ "web-origins", "acr", "profile", "roles", "email" ],
    "optionalClientScopes" : [ "address", "phone", "offline_access", "microprofile-jwt" ]
  }, {
    "id" : "87251bec-caf0-4ed4-adac-02bf627869d0",
    "clientId" : "security-admin-console",
    "name" : "${client_security-admin-console}",
    "rootUrl" : "${authAdminUrl}",
    "baseUrl" : "/admin/bastion/console/",
    "surrogateAuthRequired" : false,
    "enabled" : true,
    "alwaysDisplayInConsole" : false,
    "clientAuthenticatorType" : "client-secret",
    "redirectUris" : [ "/admin/bastion/console/*" ],
    "webOrigins" : [ "+" ],
    "notBefore" : 0,
    "bearerOnly" : false,
    "consentRequired" : false,
    "standardFlowEnabled" : true,
    "implicitFlowEnabled" : false,
    "directAccessGrantsEnabled" : false,
    "serviceAccountsEnabled" : false,
    "publicClient" : true,
    "frontchannelLogout" : false,
    "protocol" : "openid-connect",
    "attributes" : {
      "post.logout.redirect.uris" : "+",
      "pkce.code.challenge.method" : "S256"
    },
    "authenticationFlowBindingOverrides" : { },
    "fullScopeAllowed" : false,
    "nodeReRegistrationTimeout" : 0,
    "protocolMappers" : [ {
      "id" : "31380081-1baa-4f17-b709-4fd9b67da855",
      "name" : "locale",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "locale",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "locale",
        "jsonType.label" : "String"
      }
    } ],
    "defaultClientScopes" : [ "web-origins", "acr", "profile", "roles", "email" ],
    "optionalClientScopes" : [ "address", "phone", "offline_access", "microprofile-jwt" ]
  } ],
  "clientScopes" : [ {
    "id" : "3a562622-1ad8-4de8-a51d-1c5dfad2bcd0",
    "name" : "profile",
    "description" : "OpenID Connect built-in scope: profile",
    "protocol" : "openid-connect",
    "attributes" : {
      "include.in.token.scope" : "true",
      "display.on.consent.screen" : "true",
      "consent.screen.text" : "${profileScopeConsentText}"
    },
    "protocolMappers" : [ {
      "id" : "87a7c3c6-9f69-479b-9bcf-3d9e56d88e93",
      "name" : "locale",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "locale",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "locale",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "3bc23f60-a7fd-41c2-85e1-910488af34e1",
      "name" : "middle name",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "middleName",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "middle_name",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "04129943-bdc2-41fb-9c72-3a80bce9acff",
      "name" : "zoneinfo",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "zoneinfo",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "zoneinfo",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "7968bfd1-1d7d-4bef-a6de-2b5c6a02c097",
      "name" : "full name",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-full-name-mapper",
      "consentRequired" : false,
      "config" : {
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "userinfo.token.claim" : "true"
      }
    }, {
      "id" : "08eab4fc-cbb7-4e65-9b6e-21c98918368d",
      "name" : "website",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "website",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "website",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "e9662696-9c3a-4fe3-8f04-ede8c266dbec",
      "name" : "family name",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "lastName",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "family_name",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "c6712f61-e9a9-4036-8c7e-f49241db12cb",
      "name" : "gender",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "gender",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "gender",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "102595a5-2b65-45e4-ad24-1e6e8b4e1900",
      "name" : "nickname",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "nickname",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "nickname",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "4967c018-c8b2-49dc-b8a7-353cdaafacaa",
      "name" : "birthdate",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "birthdate",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "birthdate",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "88f4b158-fbe9-40fa-be10-4e50241fa467",
      "name" : "updated at",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "updatedAt",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "updated_at",
        "jsonType.label" : "long"
      }
    }, {
      "id" : "5986258b-6cf7-4e30-8a72-b74f7333caaa",
      "name" : "given name",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "firstName",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "given_name",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "2f41d6dd-26be-4553-b7fb-f8280d8e04e9",
      "name" : "username",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "username",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "preferred_username",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "719f65ae-ea42-4775-ac82-e905c4d73c43",
      "name" : "profile",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "profile",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "profile",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "0b4869d2-d013-41e9-866a-cfde00bcf529",
      "name" : "picture",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "picture",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "picture",
        "jsonType.label" : "String"
      }
    } ]
  }, {
    "id" : "13aa13b8-58cf-466a-b8e9-db191e004239",
    "name" : "acr",
    "description" : "OpenID Connect scope for add acr (authentication context class reference) to the token",
    "protocol" : "openid-connect",
    "attributes" : {
      "include.in.token.scope" : "false",
      "display.on.consent.screen" : "false"
    },
    "protocolMappers" : [ {
      "id" : "5c82360e-7f72-4257-a409-53268d42793d",
      "name" : "acr loa level",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-acr-mapper",
      "consentRequired" : false,
      "config" : {
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "userinfo.token.claim" : "true"
      }
    } ]
  }, {
    "id" : "7bd3220d-4f40-4110-b894-7e670d61ebf2",
    "name" : "phone",
    "description" : "OpenID Connect built-in scope: phone",
    "protocol" : "openid-connect",
    "attributes" : {
      "include.in.token.scope" : "true",
      "display.on.consent.screen" : "true",
      "consent.screen.text" : "${phoneScopeConsentText}"
    },
    "protocolMappers" : [ {
      "id" : "e9dc9c5c-540c-4821-b101-2eb63ec78b31",
      "name" : "phone number",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "phoneNumber",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "phone_number",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "45423920-1107-4aa6-a590-dda0b763f94a",
      "name" : "phone number verified",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "phoneNumberVerified",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "phone_number_verified",
        "jsonType.label" : "boolean"
      }
    } ]
  }, {
    "id" : "5522c3e6-99ca-4274-af46-15e6e78c8d74",
    "name" : "offline_access",
    "description" : "OpenID Connect built-in scope: offline_access",
    "protocol" : "openid-connect",
    "attributes" : {
      "consent.screen.text" : "${offlineAccessScopeConsentText}",
      "display.on.consent.screen" : "true"
    }
  }, {
    "id" : "ac22f2b4-6e31-4d1d-852c-a8910034767d",
    "name" : "roles",
    "description" : "OpenID Connect scope for add user roles to the access token",
    "protocol" : "openid-connect",
    "attributes" : {
      "include.in.token.scope" : "false",
      "display.on.consent.screen" : "true",
      "consent.screen.text" : "${rolesScopeConsentText}"
    },
    "protocolMappers" : [ {
      "id" : "dc3badda-0a6a-441e-b353-c9733bf2af5a",
      "name" : "audience resolve",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-audience-resolve-mapper",
      "consentRequired" : false,
      "config" : { }
    }, {
      "id" : "76b5f1a5-87d7-4639-bda1-103b9b5f14ae",
      "name" : "realm roles",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-realm-role-mapper",
      "consentRequired" : false,
      "config" : {
        "user.attribute" : "foo",
        "access.token.claim" : "true",
        "claim.name" : "realm_access.roles",
        "jsonType.label" : "String",
        "multivalued" : "true"
      }
    }, {
      "id" : "9daab500-3c6d-4b1f-8653-a04b03fc5ca2",
      "name" : "client roles",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-client-role-mapper",
      "consentRequired" : false,
      "config" : {
        "user.attribute" : "foo",
        "access.token.claim" : "true",
        "claim.name" : "resource_access.${client_id}.roles",
        "jsonType.label" : "String",
        "multivalued" : "true"
      }
    } ]
  }, {
    "id" : "a862a1be-e7bd-458f-9ddc-27e4ba72255d",
    "name" : "email",
    "description" : "OpenID Connect built-in scope: email",
    "protocol" : "openid-connect",
    "attributes" : {
      "include.in.token.scope" : "true",
      "display.on.consent.screen" : "true",
      "consent.screen.text" : "${emailScopeConsentText}"
    },
    "protocolMappers" : [ {
      "id" : "4f546318-fdf6-4f35-8df1-512a8d0d4c3d",
      "name" : "email",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "email",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "email",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "6569284d-b9d2-436f-be4e-f528f8640fdc",
      "name" : "email verified",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-property-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "emailVerified",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "email_verified",
        "jsonType.label" : "boolean"
      }
    } ]
  }, {
    "id" : "2cfa343d-66da-41ee-a2f0-33b26a3e7c14",
    "name" : "address",
    "description" : "OpenID Connect built-in scope: address",
    "protocol" : "openid-connect",
    "attributes" : {
      "include.in.token.scope" : "true",
      "display.on.consent.screen" : "true",
      "consent.screen.text" : "${addressScopeConsentText}"
    },
    "protocolMappers" : [ {
      "id" : "add84a48-655b-47af-bf27-6a9a13af6e61",
      "name" : "address",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-address-mapper",
      "consentRequired" : false,
      "config" : {
        "user.attribute.formatted" : "formatted",
        "user.attribute.country" : "country",
        "user.attribute.postal_code" : "postal_code",
        "userinfo.token.claim" : "true",
        "user.attribute.street" : "street",
        "id.token.claim" : "true",
        "user.attribute.region" : "region",
        "access.token.claim" : "true",
        "user.attribute.locality" : "locality"
      }
    } ]
  }, {
    "id" : "69c1f772-e4e7-4804-a7de-117a1b637ce9",
    "name" : "web-origins",
    "description" : "OpenID Connect scope for add allowed web origins to the access token",
    "protocol" : "openid-connect",
    "attributes" : {
      "include.in.token.scope" : "false",
      "display.on.consent.screen" : "false",
      "consent.screen.text" : ""
    },
    "protocolMappers" : [ {
      "id" : "d6006953-1572-4bb5-9e99-427d2942b504",
      "name" : "allowed web origins",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-allowed-origins-mapper",
      "consentRequired" : false,
      "config" : { }
    } ]
  }, {
    "id" : "c6fa60d5-fbf6-4ee9-943b-7e63acd90f98",
    "name" : "microprofile-jwt",
    "description" : "Microprofile - JWT built-in scope",
    "protocol" : "openid-connect",
    "attributes" : {
      "include.in.token.scope" : "true",
      "display.on.consent.screen" : "false"
    },
    "protocolMappers" : [ {
      "id" : "5bda613a-9d86-4b0c-9e3a-fe96241f0b3b",
      "name" : "upn",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-attribute-mapper",
      "consentRequired" : false,
      "config" : {
        "userinfo.token.claim" : "true",
        "user.attribute" : "username",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "upn",
        "jsonType.label" : "String"
      }
    }, {
      "id" : "316de532-c6e9-4097-a46a-730693b1ea46",
      "name" : "groups",
      "protocol" : "openid-connect",
      "protocolMapper" : "oidc-usermodel-realm-role-mapper",
      "consentRequired" : false,
      "config" : {
        "multivalued" : "true",
        "userinfo.token.claim" : "true",
        "user.attribute" : "foo",
        "id.token.claim" : "true",
        "access.token.claim" : "true",
        "claim.name" : "groups",
        "jsonType.label" : "String"
      }
    } ]
  }, {
    "id" : "2b427d3f-47f6-4fe5-a284-92589aee4dc8",
    "name" : "role_list",
    "description" : "SAML role list",
    "protocol" : "saml",
    "attributes" : {
      "consent.screen.text" : "${samlRoleListScopeConsentText}",
      "display.on.consent.screen" : "true"
    },
    "protocolMappers" : [ {
      "id" : "b5ccd13e-fcd8-4678-a0a4-f57238a8547c",
      "name" : "role list",
      "protocol" : "saml",
      "protocolMapper" : "saml-role-list-mapper",
      "consentRequired" : false,
      "config" : {
        "single" : "false",
        "attribute.nameformat" : "Basic",
        "attribute.name" : "Role"
      }
    } ]
  } ],
  "defaultDefaultClientScopes" : [ "role_list", "profile", "email", "roles", "web-origins", "acr" ],
  "defaultOptionalClientScopes" : [ "offline_access", "address", "phone", "microprofile-jwt" ],
  "browserSecurityHeaders" : {
    "contentSecurityPolicyReportOnly" : "",
    "xContentTypeOptions" : "nosniff",
    "referrerPolicy" : "no-referrer",
    "xRobotsTag" : "none",
    "xFrameOptions" : "SAMEORIGIN",
    "contentSecurityPolicy" : "frame-src 'self'; frame-ancestors 'self'; object-src 'none';",
    "xXSSProtection" : "1; mode=block",
    "strictTransportSecurity" : "max-age=31536000; includeSubDomains"
  },
  "smtpServer" : { },
  "eventsEnabled" : false,
  "eventsListeners" : [ "kafka-connector-event-listener", "jboss-logging" ],
  "enabledEventTypes" : [ ],
  "adminEventsEnabled" : false,
  "adminEventsDetailsEnabled" : false,
  "identityProviders" : [ ],
  "identityProviderMappers" : [ ],
  "components" : {
    "org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy" : [ {
      "id" : "39275c57-81db-423d-ac72-e0621f4962ef",
      "name" : "Allowed Client Scopes",
      "providerId" : "allowed-client-templates",
      "subType" : "anonymous",
      "subComponents" : { },
      "config" : {
        "allow-default-scopes" : [ "true" ]
      }
    }, {
      "id" : "d4c27629-4f15-4e2d-8874-96bd64ca617f",
      "name" : "Allowed Protocol Mapper Types",
      "providerId" : "allowed-protocol-mappers",
      "subType" : "anonymous",
      "subComponents" : { },
      "config" : {
        "allowed-protocol-mapper-types" : [ "oidc-address-mapper", "saml-user-attribute-mapper", "oidc-sha256-pairwise-sub-mapper", "oidc-full-name-mapper", "saml-role-list-mapper", "oidc-usermodel-property-mapper", "oidc-usermodel-attribute-mapper", "saml-user-property-mapper" ]
      }
    }, {
      "id" : "21f91681-04a8-41b9-a412-b2fdd2604733",
      "name" : "Allowed Client Scopes",
      "providerId" : "allowed-client-templates",
      "subType" : "authenticated",
      "subComponents" : { },
      "config" : {
        "allow-default-scopes" : [ "true" ]
      }
    }, {
      "id" : "11a350fd-09ee-4c4f-91b7-890e1ef805de",
      "name" : "Max Clients Limit",
      "providerId" : "max-clients",
      "subType" : "anonymous",
      "subComponents" : { },
      "config" : {
        "max-clients" : [ "200" ]
      }
    }, {
      "id" : "77d32b10-c4c2-4c44-9af2-a53fdb5905db",
      "name" : "Trusted Hosts",
      "providerId" : "trusted-hosts",
      "subType" : "anonymous",
      "subComponents" : { },
      "config" : {
        "host-sending-registration-request-must-match" : [ "true" ],
        "client-uris-must-match" : [ "true" ]
      }
    }, {
      "id" : "606b749d-f315-42e7-aed5-5e7dcc7d9b69",
      "name" : "Consent Required",
      "providerId" : "consent-required",
      "subType" : "anonymous",
      "subComponents" : { },
      "config" : { }
    }, {
      "id" : "3f70f52f-40a6-43cb-8a16-340d50c698cb",
      "name" : "Allowed Protocol Mapper Types",
      "providerId" : "allowed-protocol-mappers",
      "subType" : "authenticated",
      "subComponents" : { },
      "config" : {
        "allowed-protocol-mapper-types" : [ "oidc-address-mapper", "saml-role-list-mapper", "oidc-full-name-mapper", "saml-user-property-mapper", "oidc-usermodel-property-mapper", "oidc-usermodel-attribute-mapper", "oidc-sha256-pairwise-sub-mapper", "saml-user-attribute-mapper" ]
      }
    }, {
      "id" : "1f264c40-8632-4928-ada6-883116bd35c6",
      "name" : "Full Scope Disabled",
      "providerId" : "scope",
      "subType" : "anonymous",
      "subComponents" : { },
      "config" : { }
    } ],
    "org.keycloak.keys.KeyProvider" : [ {
      "id" : "c01a1149-1e79-4923-923c-747182968506",
      "name" : "rsa-enc-generated",
      "providerId" : "rsa-enc-generated",
      "subComponents" : { },
      "config" : {
        "privateKey" : [ "MIIEowIBAAKCAQEAqK7qZl4g+j0jMJW1wHRZjyGBhQ+5eK++/FfeclxFCiCrugZkW20NsL6/9xqc9OH9Wo10j5cyDVJbwukJWEW1imbZYWtVhhBQSstTt7Yr/LmxdR1uQ7T67P+X3F1H9P0anXNN7SOmXS2P7lPdXXxuCWMTLB/CPboFJcd7N6suWa5HtsORHatq5XDGVCPhDu1m9yhTYVR1GgF4bjqf9nBQULAkxFVctNCbt7DAYOS7b48vrIF+viQaDyfkFJREDo4EusrqFY0ZD2jlx+BjpQ+/i39C6Y7gQ+fm4UujDvm+fnAKTFVnksGXFnAw+evxXaiNWEC7Z6PM/wfimMe7j88DfQIDAQABAoIBACkxghuarBoAOSpBvT9xCnf6OjuI8gXHgW/1c2ThJJkLDnTg37w1/wxlINMTBDaHQ8xL1CXGyhnXvYH1T+tnJqTUZgy03g9dx4Xkbp7kFYzjujL8C3PsbATZjDfr7ckl0EyYHnUlahjCKi6M+3e7jdGsCMATR2e0mFI4C162ZpzOncIb1kbmftcyTFf/EwsLfNu2NWuP4yeJmbYY8d8g5y4FG980TPUtYr9q/dNGTDj73TJlnpFzQGtysU/BqKhagTxh3L5Kc/MFF4sAMxEiHuvC/nYuR/fxS5TqO/NxmFEctHgw0zaGSlWs61ZOHB5hyqYgk2yMOnY3XEo5m75fOaECgYEA0tZAdbZnToRvYLBZkxU486twRr5JGb/l57MPy4O0ijNFUFlqhGPf54stvo6g5xtGtxGRJmOkO88QMETqf0a3V6l0uWjtdo9xfzRp27NKkT9RVTDEpllrRfBXlUo7gG9RgJ6+QBtetjYi5ddHDEItnGDrT7o80juTFsnfUBYv2HECgYEAzNERJBO/ys6KWZEFVdnt6GM9P/I1jKzhXJtLNIxIK2I3o0xnNyVWyc2M9d5S11sakbKv5lo6/l26/w4JwEUKb6F8j7N9kYl9tsKO0bHA1EbasUOYU2zanB+LDa+KVTWQap3SeZsMVDpwxXUT6bbUecDC7MyPHr8LWH7LydMqQc0CgYEAgufaP/wP6nVZ/gugoi0UHl78qD/vfVhjs9e+39qXlxM8XyYVd7vXQplsvpsqFjQeVP5IRDCrwSLQZ1fyzTGoFnq1aYVXozxu+M8fRvTsQICyzBUqlCqC63rNtnjPtu/nB9gIQh98T+APDOv8RgU08ppOoEL/Dn1E12piCASuklECgYAiRi4fImrq7ks6l8kTx8dHJyw9wjNx2hBQZfBc18jP8byryAJRuR7f4FThZBXq0eUNUqCa5KiQnnDHc7rwAN2xNo3Yokm2DBMMfVxW/O7u1viLx2r7MvEWRTUI0kJM5gzHuqdZEDgs9Cag9Gmjp6PAyCAWbljY5VFpurYxjPO6VQKBgCMWFhCJCu4h6yxr6BYqinIGRk+o4BXVvtqXxtjTRUSBs9xvk0gMz+zG7U2BFtqrYIgrBv7qhpvDaUXBp2xbE2YIsUgzlQMD9WGLxvHmoXX8GLk09ZOiF+ib6HRC3gvmeWkeznL7DAg1ByS7jIC1t2uwPBqu/7ET/XC9EyCIX6t6" ],
        "keyUse" : [ "ENC" ],
        "certificate" : [ "MIICnTCCAYUCBgGKVpb+7jANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdiYXN0aW9uMB4XDTIzMDkwMjE1NDkxMFoXDTMzMDkwMjE1NTA1MFowEjEQMA4GA1UEAwwHYmFzdGlvbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKiu6mZeIPo9IzCVtcB0WY8hgYUPuXivvvxX3nJcRQogq7oGZFttDbC+v/canPTh/VqNdI+XMg1SW8LpCVhFtYpm2WFrVYYQUErLU7e2K/y5sXUdbkO0+uz/l9xdR/T9Gp1zTe0jpl0tj+5T3V18bgljEywfwj26BSXHezerLlmuR7bDkR2rauVwxlQj4Q7tZvcoU2FUdRoBeG46n/ZwUFCwJMRVXLTQm7ewwGDku2+PL6yBfr4kGg8n5BSURA6OBLrK6hWNGQ9o5cfgY6UPv4t/QumO4EPn5uFLow75vn5wCkxVZ5LBlxZwMPnr8V2ojVhAu2ejzP8H4pjHu4/PA30CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEATV2cnW9snz8B6kuzCMI7wgmi//mUm3dxNjQQaEjlORPhTpsFt34JMo3qPhrSvUa3wMkYNw3xuDtCHbjBxDSmhE2sbsKX0NOM/tRrXaOlmiofG6c8OFljctMvuQ97pqEpTxLuxNlpIPAC2SPmEE7YCyHFjsReeYLkzCjjL+d6LWVYum3Dskn5Zn/Gv98F6qpA3oKJRoEDWx5Xwvbm1AiUOPVNULpykU2o23SJGsjcNwI5teS2crESd5BuLwLsyRCUF7j4S6d8yWaTKxs4q7sId3m49aC4NJCuFkHSxuExDnrRTX0JgYMxa3WW/b9Mx8NkCJI8P0190rOJwSmSwZWh3w==" ],
        "priority" : [ "100" ],
        "algorithm" : [ "RSA-OAEP" ]
      }
    }, {
      "id" : "d79f7038-e477-4643-b2f6-1d0380af92fe",
      "name" : "rsa-generated",
      "providerId" : "rsa-generated",
      "subComponents" : { },
      "config" : {
        "privateKey" : [ "MIIEowIBAAKCAQEA7bJdaHF84hwuhCkOjTNxunO3RYc35/6o3MMEZ6v5dPF/iaddT6spaBGulMSwjmRpl2VVIffUZnov6wOF+dWxDJCGJ3rnHlP+3nPqmzBNIeBZUCboV1MYMPHtmFoalNhHjWqFirtgxfLc1MJIniIMYhDhSaZaARqVk+iM2+l0XwpgSLgJ9h9wZA3iwxi/7obLZuRZwFtf9q1TDAc44+US611YUVIlVczakaPLtFEKTMl9A+U5yRluI1nZ+lpgNvpumDjInh7BsHZmOnMZfp4hWBojjhg/Aeu65iw7AyLCU0IdK3D1n9BHjqU8Qnsyw1WGyIpVHpriTPQEA+18qtsVHwIDAQABAoIBAAjjQvfdSnif6iNZ76fa9RUuL3ujjzUXAhRjHF6OASFcyFKK1gPdGArCon8AjcN9QK9/A/xlqmT8i58jfhZ15Y1dOA7w2wR4yo5h0jNkTnYGUACdu9FME5r86M/qCpVnMuG4Sm8CC5/LMXOpIhL7ne/qxqm81R+2cUJbDy1H4OiOxdETt7fD9Dprco3bruM5goY880Gb5W323aC1Q+kqJrOhFyg7jxQc4fk4Lk2J/EQXYqd4KMZSosO+gpQvnNWs+XFlygMJOW5rLd5PxXNBiYTIOxNKvTkwd3gNM54d0tSRn40NMuEygW/lRgEjNc3NTYK6JjYb9Kuc8sHe2hFFuEkCgYEA+UcUzk+ASDiy6oNrj7V1Oi9AgwFfbQ0FFCDAbRi/HsVW/5IWIsU3Y+ga1nET0ESRGhYJcwrarRT1ghnfenuzXuWpyL1WOZF6UTkeUMRs6WS0HO6Qs2/5pNu/FrF3vIgniwz4TtcSF7ioqDHl3SCYeyO2pOY5GKDGk1FCjoyAm9cCgYEA9BtVUipkB0Zk8v5Og6aP8rZ3pjbYh7C+R2zu35j/Nbm2c1pLmHWH0kU6qBb3dk1qMTeh+tKS15TrLaawYhI3HhNFrA90wFzEKVNFqToq3pjMXhz2l/UDnsm+FlbYa3PTQi6wp16dbAUh1PLxsNXdWIePHHmNh+cIeNArK/NwZ/kCgYAJqUOZK2OhaPEmPamxjCra8nHhoe/83gBQY2SR1d+yZZuVlCffeR1Idfp0TTWjYMTu6eO73bPT+Xf6bt5GdPzitKv757qryIOhGkGeh75g3VJNvMFG8xQN26ZwTriBShWeQgZtp9A/sxx2SFjMVTMTsrKleXbFCZYop4GY3MEvSQKBgQDQNTwqECQvnFhgdo7LdddUA1S8vg0kd5lk3MJGj34m+hdn/n16Nc06iXgFhUlfa5qHDlen09IR9WA/GO1bSQQgL/n+T1Sa+sUKJo/FTurf4F54a6XdaMvEtXjgHwULacioq6BbsbT+PMZlly6VUWUxrLZhaEBSybmNKqmYHFUlKQKBgCH5CmdHV2IR5Dj4j+kNIXUfmLwQPANneRSp+B/90XrAfZ1m4vd6GDwRIAL+v+rfUWF3EcFsf+9LpoK3mopsSfHGKFt/nDmiSbu5zCmFJ5cPGUyc0iBoz65t00FZOU7EfrQVlF1QV9X5tHmizattYon5jhvS5+VbB1Y8SG3e6t+T" ],
        "keyUse" : [ "SIG" ],
        "certificate" : [ "MIICnTCCAYUCBgGKVpb+nDANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdiYXN0aW9uMB4XDTIzMDkwMjE1NDkxMFoXDTMzMDkwMjE1NTA1MFowEjEQMA4GA1UEAwwHYmFzdGlvbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAO2yXWhxfOIcLoQpDo0zcbpzt0WHN+f+qNzDBGer+XTxf4mnXU+rKWgRrpTEsI5kaZdlVSH31GZ6L+sDhfnVsQyQhid65x5T/t5z6pswTSHgWVAm6FdTGDDx7ZhaGpTYR41qhYq7YMXy3NTCSJ4iDGIQ4UmmWgEalZPojNvpdF8KYEi4CfYfcGQN4sMYv+6Gy2bkWcBbX/atUwwHOOPlEutdWFFSJVXM2pGjy7RRCkzJfQPlOckZbiNZ2fpaYDb6bpg4yJ4ewbB2ZjpzGX6eIVgaI44YPwHruuYsOwMiwlNCHStw9Z/QR46lPEJ7MsNVhsiKVR6a4kz0BAPtfKrbFR8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAXAnBhHaJv5zyr+wGpTSl26XH4uWKv5cyDGpqRo1siOKsYfLR+8TtL1yOkitlEOKN7GkTB/lINmtj89LvqfRpinj8Kopc+RZ3QgtEgOa7Ym54Y27GbkF3lYlPjAcxIsYbqyj7AThKnFQYaN/yt3FSRp5iksYEO5g5miDGJZyFBgzIo9fv8LruGXZOC95WZ2YXI3qLw9uUODgEhYSeOdJv/4CBWqsD6m1v2nri7/ByijHs0ma5h3tvtiRG05Ej88SCGACIsF6pAwPboHe1WQPy2hi2RS/jt3oqAy1kBedHrL3tgSNSLphVxBTFdf1tCsijBTAAPKUK/hXqXy5HwXzN8w==" ],
        "priority" : [ "100" ]
      }
    }, {
      "id" : "019392b9-41e8-4f20-a06f-7a5bf0832f19",
      "name" : "hmac-generated",
      "providerId" : "hmac-generated",
      "subComponents" : { },
      "config" : {
        "kid" : [ "134f2312-91a2-4a6d-adb3-6fda6717226a" ],
        "secret" : [ "aGEP50_fhhk0FtBW4xjdankj-8cGn3zHiz8lc6FEnoL_Ythox5vq7UgBuLVNeRSwINynexUVGJdn9v4WESDJBw" ],
        "priority" : [ "100" ],
        "algorithm" : [ "HS256" ]
      }
    }, {
      "id" : "87ad6f33-dcde-4e9c-836b-fe2c7c3102d3",
      "name" : "aes-generated",
      "providerId" : "aes-generated",
      "subComponents" : { },
      "config" : {
        "kid" : [ "bb121a73-a0bd-4a92-918e-d75b8f5a209e" ],
        "secret" : [ "PjM4kMJhgDdWWvDtp7n-5w" ],
        "priority" : [ "100" ]
      }
    } ]
  },
  "internationalizationEnabled" : false,
  "supportedLocales" : [ ],
  "authenticationFlows" : [ {
    "id" : "fd19f087-bac2-4ee4-9c71-1717372979b8",
    "alias" : "Account verification options",
    "description" : "Method with which to verity the existing account",
    "providerId" : "basic-flow",
    "topLevel" : false,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "idp-email-verification",
      "authenticatorFlow" : false,
      "requirement" : "ALTERNATIVE",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticatorFlow" : true,
      "requirement" : "ALTERNATIVE",
      "priority" : 20,
      "autheticatorFlow" : true,
      "flowAlias" : "Verify Existing Account by Re-authentication",
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "f58cc37f-159d-4a3a-b21f-a9a2ddb82ba9",
    "alias" : "Browser - Conditional OTP",
    "description" : "Flow to determine if the OTP is required for the authentication",
    "providerId" : "basic-flow",
    "topLevel" : false,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "conditional-user-configured",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "auth-otp-form",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 20,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "0589a4f0-0fed-4976-9547-9157a7fd7522",
    "alias" : "Direct Grant - Conditional OTP",
    "description" : "Flow to determine if the OTP is required for the authentication",
    "providerId" : "basic-flow",
    "topLevel" : false,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "conditional-user-configured",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "direct-grant-validate-otp",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 20,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "6df06dc9-4260-4768-9a4e-d42a61b4406f",
    "alias" : "First broker login - Conditional OTP",
    "description" : "Flow to determine if the OTP is required for the authentication",
    "providerId" : "basic-flow",
    "topLevel" : false,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "conditional-user-configured",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "auth-otp-form",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 20,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "e02364c2-8a7e-4500-87e3-af80c4066da1",
    "alias" : "Handle Existing Account",
    "description" : "Handle what to do if there is existing account with same email/username like authenticated identity provider",
    "providerId" : "basic-flow",
    "topLevel" : false,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "idp-confirm-link",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticatorFlow" : true,
      "requirement" : "REQUIRED",
      "priority" : 20,
      "autheticatorFlow" : true,
      "flowAlias" : "Account verification options",
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "f75b0d29-3cf2-4a12-8d96-42ca753dd0e0",
    "alias" : "Reset - Conditional OTP",
    "description" : "Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.",
    "providerId" : "basic-flow",
    "topLevel" : false,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "conditional-user-configured",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "reset-otp",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 20,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "49fa4601-f198-4d6f-a89a-c098a0dfd1db",
    "alias" : "User creation or linking",
    "description" : "Flow for the existing/non-existing user alternatives",
    "providerId" : "basic-flow",
    "topLevel" : false,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticatorConfig" : "create unique user config",
      "authenticator" : "idp-create-user-if-unique",
      "authenticatorFlow" : false,
      "requirement" : "ALTERNATIVE",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticatorFlow" : true,
      "requirement" : "ALTERNATIVE",
      "priority" : 20,
      "autheticatorFlow" : true,
      "flowAlias" : "Handle Existing Account",
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "3e0258ae-60eb-496f-a47e-3d9eed4778fe",
    "alias" : "Verify Existing Account by Re-authentication",
    "description" : "Reauthentication of existing account",
    "providerId" : "basic-flow",
    "topLevel" : false,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "idp-username-password-form",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticatorFlow" : true,
      "requirement" : "CONDITIONAL",
      "priority" : 20,
      "autheticatorFlow" : true,
      "flowAlias" : "First broker login - Conditional OTP",
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "1d168d3b-4354-4d98-acf6-1f81cd566f0a",
    "alias" : "browser",
    "description" : "browser based authentication",
    "providerId" : "basic-flow",
    "topLevel" : true,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "auth-cookie",
      "authenticatorFlow" : false,
      "requirement" : "ALTERNATIVE",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "auth-spnego",
      "authenticatorFlow" : false,
      "requirement" : "DISABLED",
      "priority" : 20,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "identity-provider-redirector",
      "authenticatorFlow" : false,
      "requirement" : "ALTERNATIVE",
      "priority" : 25,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticatorFlow" : true,
      "requirement" : "ALTERNATIVE",
      "priority" : 30,
      "autheticatorFlow" : true,
      "flowAlias" : "forms",
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "7b233dc8-8206-4e31-bc77-0ae835a3ae1d",
    "alias" : "clients",
    "description" : "Base authentication for clients",
    "providerId" : "client-flow",
    "topLevel" : true,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "client-secret",
      "authenticatorFlow" : false,
      "requirement" : "ALTERNATIVE",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "client-jwt",
      "authenticatorFlow" : false,
      "requirement" : "ALTERNATIVE",
      "priority" : 20,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "client-secret-jwt",
      "authenticatorFlow" : false,
      "requirement" : "ALTERNATIVE",
      "priority" : 30,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "client-x509",
      "authenticatorFlow" : false,
      "requirement" : "ALTERNATIVE",
      "priority" : 40,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "768f6670-55c3-48b4-a4e6-3f5bfa8b5803",
    "alias" : "direct grant",
    "description" : "OpenID Connect Resource Owner Grant",
    "providerId" : "basic-flow",
    "topLevel" : true,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "direct-grant-validate-username",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "direct-grant-validate-password",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 20,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticatorFlow" : true,
      "requirement" : "CONDITIONAL",
      "priority" : 30,
      "autheticatorFlow" : true,
      "flowAlias" : "Direct Grant - Conditional OTP",
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "7e0a1171-e746-40a4-b526-ff3b46488591",
    "alias" : "docker auth",
    "description" : "Used by Docker clients to authenticate against the IDP",
    "providerId" : "basic-flow",
    "topLevel" : true,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "docker-http-basic-authenticator",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "7e11f984-b894-4eb8-9597-a42071554fbf",
    "alias" : "first broker login",
    "description" : "Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account",
    "providerId" : "basic-flow",
    "topLevel" : true,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticatorConfig" : "review profile config",
      "authenticator" : "idp-review-profile",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticatorFlow" : true,
      "requirement" : "REQUIRED",
      "priority" : 20,
      "autheticatorFlow" : true,
      "flowAlias" : "User creation or linking",
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "2382a4de-33ac-459d-a942-563f597f0f55",
    "alias" : "forms",
    "description" : "Username, password, otp and other auth forms.",
    "providerId" : "basic-flow",
    "topLevel" : false,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "auth-username-password-form",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticatorFlow" : true,
      "requirement" : "CONDITIONAL",
      "priority" : 20,
      "autheticatorFlow" : true,
      "flowAlias" : "Browser - Conditional OTP",
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "bad92513-ae02-4c0b-bb7d-f152769b1c3d",
    "alias" : "registration",
    "description" : "registration flow",
    "providerId" : "basic-flow",
    "topLevel" : true,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "registration-page-form",
      "authenticatorFlow" : true,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : true,
      "flowAlias" : "registration form",
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "6b422c2d-dffd-43ce-ab3e-116c1bb52275",
    "alias" : "registration form",
    "description" : "registration form",
    "providerId" : "form-flow",
    "topLevel" : false,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "registration-user-creation",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 20,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "registration-profile-action",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 40,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "registration-password-action",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 50,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "registration-recaptcha-action",
      "authenticatorFlow" : false,
      "requirement" : "DISABLED",
      "priority" : 60,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "49e83893-e275-44f6-8dce-c195d2f0a80b",
    "alias" : "reset credentials",
    "description" : "Reset credentials for a user if they forgot their password or something",
    "providerId" : "basic-flow",
    "topLevel" : true,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "reset-credentials-choose-user",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "reset-credential-email",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 20,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticator" : "reset-password",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 30,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    }, {
      "authenticatorFlow" : true,
      "requirement" : "CONDITIONAL",
      "priority" : 40,
      "autheticatorFlow" : true,
      "flowAlias" : "Reset - Conditional OTP",
      "userSetupAllowed" : false
    } ]
  }, {
    "id" : "bae161d4-8c4c-4f0f-b82d-9691228dc3de",
    "alias" : "saml ecp",
    "description" : "SAML ECP Profile Authentication Flow",
    "providerId" : "basic-flow",
    "topLevel" : true,
    "builtIn" : true,
    "authenticationExecutions" : [ {
      "authenticator" : "http-basic-authenticator",
      "authenticatorFlow" : false,
      "requirement" : "REQUIRED",
      "priority" : 10,
      "autheticatorFlow" : false,
      "userSetupAllowed" : false
    } ]
  } ],
  "authenticatorConfig" : [ {
    "id" : "9561a8c4-20fc-4b29-be8c-9ed53d2288cf",
    "alias" : "create unique user config",
    "config" : {
      "require.password.update.after.registration" : "false"
    }
  }, {
    "id" : "bca61d30-813c-4dd4-94e1-4fb6050409ff",
    "alias" : "review profile config",
    "config" : {
      "update.profile.on.first.login" : "missing"
    }
  } ],
  "requiredActions" : [ {
    "alias" : "CONFIGURE_TOTP",
    "name" : "Configure OTP",
    "providerId" : "CONFIGURE_TOTP",
    "enabled" : true,
    "defaultAction" : false,
    "priority" : 10,
    "config" : { }
  }, {
    "alias" : "TERMS_AND_CONDITIONS",
    "name" : "Terms and Conditions",
    "providerId" : "TERMS_AND_CONDITIONS",
    "enabled" : false,
    "defaultAction" : false,
    "priority" : 20,
    "config" : { }
  }, {
    "alias" : "UPDATE_PASSWORD",
    "name" : "Update Password",
    "providerId" : "UPDATE_PASSWORD",
    "enabled" : true,
    "defaultAction" : false,
    "priority" : 30,
    "config" : { }
  }, {
    "alias" : "UPDATE_PROFILE",
    "name" : "Update Profile",
    "providerId" : "UPDATE_PROFILE",
    "enabled" : true,
    "defaultAction" : false,
    "priority" : 40,
    "config" : { }
  }, {
    "alias" : "VERIFY_EMAIL",
    "name" : "Verify Email",
    "providerId" : "VERIFY_EMAIL",
    "enabled" : true,
    "defaultAction" : false,
    "priority" : 50,
    "config" : { }
  }, {
    "alias" : "delete_account",
    "name" : "Delete Account",
    "providerId" : "delete_account",
    "enabled" : false,
    "defaultAction" : false,
    "priority" : 60,
    "config" : { }
  }, {
    "alias" : "webauthn-register",
    "name" : "Webauthn Register",
    "providerId" : "webauthn-register",
    "enabled" : true,
    "defaultAction" : false,
    "priority" : 70,
    "config" : { }
  }, {
    "alias" : "webauthn-register-passwordless",
    "name" : "Webauthn Register Passwordless",
    "providerId" : "webauthn-register-passwordless",
    "enabled" : true,
    "defaultAction" : false,
    "priority" : 80,
    "config" : { }
  }, {
    "alias" : "update_user_locale",
    "name" : "Update User Locale",
    "providerId" : "update_user_locale",
    "enabled" : true,
    "defaultAction" : false,
    "priority" : 1000,
    "config" : { }
  } ],
  "browserFlow" : "browser",
  "registrationFlow" : "registration",
  "directGrantFlow" : "direct grant",
  "resetCredentialsFlow" : "reset credentials",
  "clientAuthenticationFlow" : "clients",
  "dockerAuthenticationFlow" : "docker auth",
  "attributes" : {
    "cibaBackchannelTokenDeliveryMode" : "poll",
    "cibaExpiresIn" : "120",
    "cibaAuthRequestedUserHint" : "login_hint",
    "oauth2DeviceCodeLifespan" : "600",
    "clientOfflineSessionMaxLifespan" : "0",
    "oauth2DevicePollingInterval" : "5",
    "clientSessionIdleTimeout" : "0",
    "parRequestUriLifespan" : "60",
    "clientSessionMaxLifespan" : "0",
    "clientOfflineSessionIdleTimeout" : "0",
    "cibaInterval" : "5",
    "realmReusableOtpCode" : "false"
  },
  "keycloakVersion" : "22.0.1",
  "userManagedAccessAllowed" : false,
  "clientProfiles" : {
    "profiles" : [ ]
  },
  "clientPolicies" : {
    "policies" : [ ]
  }
}