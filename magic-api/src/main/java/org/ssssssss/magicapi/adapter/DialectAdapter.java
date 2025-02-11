package org.ssssssss.magicapi.adapter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.ssssssss.magicapi.dialect.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DialectAdapter {

	private static final Logger logger = LoggerFactory.getLogger(DialectAdapter.class);

	private final List<Dialect> dialectList = new ArrayList<>();

	public DialectAdapter() {
		add(new MySQLDialect());
		add(new OracleDialect());
		add(new PostgreSQLDialect());
		add(new ClickhouseDialect());
		add(new DB2Dialect());
		add(new SQLServerDialect());
		add(new SQLServer2005Dialect());
		add(new DmDialect());
		add(new KingbaseSQLDialect());
	}

	public void add(Dialect dialect) {
		this.dialectList.add(0, dialect);
	}

	public Dialect getDialectFromConnection(Connection connection) {
		for (Dialect dialect : dialectList) {
			try {
				if (dialect.match(connection)) {
					return dialect;
				}
			} catch (SQLException e) {
				logger.debug("方言{}匹配失败", dialect, e);
			}
		}
		logger.warn("magic-api在{}中无法获取dialect", connection);
		return null;
	}


}
