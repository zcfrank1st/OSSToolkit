package com.oss.operations;

import java.sql.Array;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.NClob;
import java.sql.PreparedStatement;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.SQLXML;
import java.sql.Savepoint;
import java.sql.Statement;
import java.sql.Struct;
import java.util.Date;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;

import com.aliyun.openservices.oss.OSSClient;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		OSSClient client = new OSSClient("PTtBteSjexMwejlq", "5TiBs4PYTZDgDlBV1vaoV2rpJe9fZ0");
		Thread t = new Thread(new ChangeHttpHeadThread(client, "zcfrank1st", "4","","","","","deflate","attachment"));
		t.start();
		
	}

}
