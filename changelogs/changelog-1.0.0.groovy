databaseChangeLog = {

	changeSet(author: "zhoudi (generated)", id: "1353694744686-1") {
		createTable(tableName: "persistent_session") {
			column(name: "id", type: "varchar(255)") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "persistent_sePK")
			}

			column(name: "creation_time", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "invalidated", type: "boolean") {
				constraints(nullable: "false")
			}

			column(name: "last_accessed_time", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "max_inactive_interval", type: "integer") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-2") {
		createTable(tableName: "persistent_session_attribute") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "persistent_sePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "session_id", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-3") {
		createTable(tableName: "persistent_session_attribute_value") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "persistent_sePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "attribute_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "serialized", type: "binary(20000)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-4") {
		createTable(tableName: "pkguser") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "pkguserPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "account_expired", type: "boolean") {
				constraints(nullable: "false")
			}

			column(name: "account_locked", type: "boolean") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "timestamp") {
				constraints(nullable: "false")
			}

			column(name: "date_expired", type: "timestamp") {
				constraints(nullable: "false")
			}

			column(name: "email", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "boolean") {
				constraints(nullable: "false")
			}

			column(name: "passwd", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_expired", type: "boolean") {
				constraints(nullable: "false")
			}

			column(name: "profile_id", type: "bigint")

			column(name: "username", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-5") {
		createTable(tableName: "profile") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "profilePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "country", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "full_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "gender", type: "varchar(17)") {
				constraints(nullable: "false")
			}

			column(name: "timezone", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-6") {
		createTable(tableName: "registration_code") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "registration_PK")
			}

			column(name: "date_created", type: "timestamp") {
				constraints(nullable: "false")
			}

			column(name: "token", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "username", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-7") {
		createTable(tableName: "role") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "rolePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "authority", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-8") {
		createTable(tableName: "server") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "serverPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "capacity", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "timestamp") {
				constraints(nullable: "false")
			}

			column(name: "hostname", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "ip_addr", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-9") {
		createTable(tableName: "server_pkguser") {
			column(name: "server_users_id", type: "bigint")

			column(name: "user_id", type: "bigint")
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-10") {
		createTable(tableName: "user_role") {
			column(name: "role_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-11") {
		addPrimaryKey(columnNames: "role_id, user_id", constraintName: "user_rolePK", tableName: "user_role")
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-12") {
		addForeignKeyConstraint(baseColumnNames: "session_id", baseTableName: "persistent_session_attribute", constraintName: "FK50C6048B92381D29", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "persistent_session", referencesUniqueColumn: "false")
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-13") {
		addForeignKeyConstraint(baseColumnNames: "attribute_id", baseTableName: "persistent_session_attribute_value", constraintName: "FK1EFE24BDF830ABF5", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "persistent_session_attribute", referencesUniqueColumn: "false")
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-14") {
		addForeignKeyConstraint(baseColumnNames: "profile_id", baseTableName: "pkguser", constraintName: "FKE132D797AC818629", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "profile", referencesUniqueColumn: "false")
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-15") {
		addForeignKeyConstraint(baseColumnNames: "server_users_id", baseTableName: "server_pkguser", constraintName: "FK740EBA9BDDAAB482", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "server", referencesUniqueColumn: "false")
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-16") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "server_pkguser", constraintName: "FK740EBA9B7149739A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "pkguser", referencesUniqueColumn: "false")
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-17") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "user_role", constraintName: "FK143BF46ACC1EAFBA", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "role", referencesUniqueColumn: "false")
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-18") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_role", constraintName: "FK143BF46A7149739A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "pkguser", referencesUniqueColumn: "false")
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-19") {
		createIndex(indexName: "username_unique_1353694744610", tableName: "pkguser", unique: "true") {
			column(name: "username")
		}
	}

	changeSet(author: "zhoudi (generated)", id: "1353694744686-20") {
		createIndex(indexName: "authority_unique_1353694744619", tableName: "role", unique: "true") {
			column(name: "authority")
		}
	}
}
