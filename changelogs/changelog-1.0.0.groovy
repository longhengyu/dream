databaseChangeLog = {

	changeSet(author: "longhengyu (generated)", id: "1366380110536-1") {
		createTable(tableName: "buyer_information") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "buyer_informaPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "address_confirmed", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "city", type: "varchar(255)")

			column(name: "company_name", type: "varchar(255)")

			column(name: "country", type: "varchar(255)")

			column(name: "country_code", type: "varchar(255)")

			column(name: "email", type: "varchar(255)")

			column(name: "first_name", type: "varchar(255)")

			column(name: "last_name", type: "varchar(255)")

			column(name: "phone_number", type: "varchar(255)")

			column(name: "receiver_name", type: "varchar(255)")

			column(name: "state", type: "varchar(255)")

			column(name: "street", type: "varchar(255)")

			column(name: "unique_customer_id", type: "varchar(255)")

			column(name: "zip", type: "varchar(255)")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-2") {
		createTable(tableName: "giftcard") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "giftcardPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "code", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "date_used", type: "datetime")

			column(name: "owner_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "product_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "purchase_id", type: "bigint")

			column(name: "status", type: "varchar(9)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-3") {
		createTable(tableName: "payment") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "paymentPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "buyer_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "buyer_information_id", type: "bigint")

			column(name: "currency", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "discount_cart_amount", type: "decimal(19,2)") {
				constraints(nullable: "false")
			}

			column(name: "paypal_transaction_id", type: "varchar(255)")

			column(name: "status", type: "varchar(9)") {
				constraints(nullable: "false")
			}

			column(name: "tax", type: "double precision(19)") {
				constraints(nullable: "false")
			}

			column(name: "transaction_id", type: "varchar(255)")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-4") {
		createTable(tableName: "payment_item") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "payment_itemPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "amount", type: "decimal(19,2)") {
				constraints(nullable: "false")
			}

			column(name: "discount_amount", type: "decimal(19,2)") {
				constraints(nullable: "false")
			}

			column(name: "item_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "item_number", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "payment_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "quantity", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "payment_items_idx", type: "integer")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-5") {
		createTable(tableName: "persistent_session") {
			column(name: "id", type: "varchar(255)") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "persistent_sePK")
			}

			column(name: "creation_time", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "invalidated", type: "bit") {
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

	changeSet(author: "longhengyu (generated)", id: "1366380110536-6") {
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

	changeSet(author: "longhengyu (generated)", id: "1366380110536-7") {
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

			column(name: "serialized", type: "blob") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-8") {
		createTable(tableName: "pkguser") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "pkguserPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "account_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "account_locked", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "date_expired", type: "datetime")

			column(name: "email", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "passwd", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "profile_id", type: "bigint")

			column(name: "server_id", type: "bigint")

			column(name: "username", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-9") {
		createTable(tableName: "product") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "productPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "code", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "varchar(1000)") {
				constraints(nullable: "false")
			}

			column(name: "image_url", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "p_day", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "p_hour", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "p_minute", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "p_month", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "p_year", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "price", type: "decimal(19,2)") {
				constraints(nullable: "false")
			}

			column(name: "status", type: "varchar(7)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-10") {
		createTable(tableName: "profile") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "profilePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "age", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "country", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "education", type: "varchar(8)") {
				constraints(nullable: "false")
			}

			column(name: "full_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "gender", type: "varchar(6)") {
				constraints(nullable: "false")
			}

			column(name: "occupation", type: "varchar(13)") {
				constraints(nullable: "false")
			}

			column(name: "os", type: "varchar(7)") {
				constraints(nullable: "false")
			}

			column(name: "purpose", type: "varchar(8)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-11") {
		createTable(tableName: "purchase") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "purchasePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "date_pay", type: "datetime")

			column(name: "owner_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "payment_method", type: "varchar(255)")

			column(name: "product_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "purchase_number", type: "varchar(255)")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-12") {
		createTable(tableName: "registration_code") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "registration_PK")
			}

			column(name: "date_created", type: "datetime") {
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

	changeSet(author: "longhengyu (generated)", id: "1366380110536-13") {
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

	changeSet(author: "longhengyu (generated)", id: "1366380110536-14") {
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

			column(name: "date_created", type: "datetime") {
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

	changeSet(author: "longhengyu (generated)", id: "1366380110536-15") {
		createTable(tableName: "user_role") {
			column(name: "role_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-16") {
		addPrimaryKey(columnNames: "role_id, user_id", constraintName: "user_rolePK", tableName: "user_role")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-17") {
		addForeignKeyConstraint(baseColumnNames: "owner_id", baseTableName: "giftcard", constraintName: "FK32A6CC40DD3023B2", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "pkguser", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-18") {
		addForeignKeyConstraint(baseColumnNames: "product_id", baseTableName: "giftcard", constraintName: "FK32A6CC4056B67869", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "product", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-19") {
		addForeignKeyConstraint(baseColumnNames: "purchase_id", baseTableName: "giftcard", constraintName: "FK32A6CC40A27806EB", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "purchase", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-20") {
		addForeignKeyConstraint(baseColumnNames: "buyer_information_id", baseTableName: "payment", constraintName: "FKD11C32064DF7D5C4", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "buyer_information", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-21") {
		addForeignKeyConstraint(baseColumnNames: "payment_id", baseTableName: "payment_item", constraintName: "FKE25C55AC2990F5A9", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "payment", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-22") {
		addForeignKeyConstraint(baseColumnNames: "session_id", baseTableName: "persistent_session_attribute", constraintName: "FK50C6048B92381D29", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "persistent_session", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-23") {
		addForeignKeyConstraint(baseColumnNames: "attribute_id", baseTableName: "persistent_session_attribute_value", constraintName: "FK1EFE24BDF830ABF5", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "persistent_session_attribute", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-24") {
		addForeignKeyConstraint(baseColumnNames: "profile_id", baseTableName: "pkguser", constraintName: "FKE132D797AC818629", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "profile", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-25") {
		addForeignKeyConstraint(baseColumnNames: "server_id", baseTableName: "pkguser", constraintName: "FKE132D7971919C7EB", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "server", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-26") {
		addForeignKeyConstraint(baseColumnNames: "owner_id", baseTableName: "purchase", constraintName: "FK67E90501DD3023B2", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "pkguser", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-27") {
		addForeignKeyConstraint(baseColumnNames: "product_id", baseTableName: "purchase", constraintName: "FK67E9050156B67869", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "product", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-28") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "user_role", constraintName: "FK143BF46ACC1EAFBA", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "role", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-29") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_role", constraintName: "FK143BF46A7149739A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "pkguser", referencesUniqueColumn: "false")
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-30") {
		createIndex(indexName: "FK32A6CC4056B67869", tableName: "giftcard") {
			column(name: "product_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-31") {
		createIndex(indexName: "FK32A6CC40A27806EB", tableName: "giftcard") {
			column(name: "purchase_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-32") {
		createIndex(indexName: "FK32A6CC40DD3023B2", tableName: "giftcard") {
			column(name: "owner_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-33") {
		createIndex(indexName: "FKD11C32064DF7D5C4", tableName: "payment") {
			column(name: "buyer_information_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-34") {
		createIndex(indexName: "FKE25C55AC2990F5A9", tableName: "payment_item") {
			column(name: "payment_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-35") {
		createIndex(indexName: "FK50C6048B92381D29", tableName: "persistent_session_attribute") {
			column(name: "session_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-36") {
		createIndex(indexName: "FK1EFE24BDF830ABF5", tableName: "persistent_session_attribute_value") {
			column(name: "attribute_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-37") {
		createIndex(indexName: "FKE132D7971919C7EB", tableName: "pkguser") {
			column(name: "server_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-38") {
		createIndex(indexName: "FKE132D797AC818629", tableName: "pkguser") {
			column(name: "profile_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-39") {
		createIndex(indexName: "username_unique_1366380110459", tableName: "pkguser", unique: "true") {
			column(name: "username")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-40") {
		createIndex(indexName: "FK67E9050156B67869", tableName: "purchase") {
			column(name: "product_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-41") {
		createIndex(indexName: "FK67E90501DD3023B2", tableName: "purchase") {
			column(name: "owner_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-42") {
		createIndex(indexName: "authority_unique_1366380110478", tableName: "role", unique: "true") {
			column(name: "authority")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-43") {
		createIndex(indexName: "FK143BF46A7149739A", tableName: "user_role") {
			column(name: "user_id")
		}
	}

	changeSet(author: "longhengyu (generated)", id: "1366380110536-44") {
		createIndex(indexName: "FK143BF46ACC1EAFBA", tableName: "user_role") {
			column(name: "role_id")
		}
	}
}
