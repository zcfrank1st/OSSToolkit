package com.oss.operations;

import java.io.InputStream;
import java.util.Date;

import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.model.OSSObject;
import com.aliyun.openservices.oss.model.ObjectMetadata;

public class ChangeHttpHeadThread implements Runnable{
	private OSSClient client = null;
	private String bucket = "";
	private String key = "";
	
	private String ct = "";
	private String cl = "";
	private String e = "";
	private String cc = "";
	private String ce = "";
	private String cd = "";
	
	public ChangeHttpHeadThread(OSSClient client, String bucket, String key,
			String ct, String cl, String e, String cc, String ce, String cd){
		this.client = client;
		this.bucket = bucket;
		this.key = key;
		
		this.ct = ct;
		this.cl = cl;
		this.e = e;
		this.cc = cc;
		this.ce = ce;
		this.cd = cd;
	}
	
	@Override
	public void run() {
		OSSObject obj = client.getObject(bucket, key);
		InputStream objectContent = obj.getObjectContent();

		ObjectMetadata meta = new ObjectMetadata();
		
		if (cc!=""){
			meta.setCacheControl(cc);
		}
		if(cd!=""){
			meta.setContentDisposition(cd);
		}
		if(ce!=""){
			meta.setContentEncoding(ce);
		}
		if(ct!=""){
			meta.setContentType(ct);
		}
		if (e!=""){
			Date expire = new Date(new Date().getTime() + Integer.parseInt(e) * 3600 * 1000);
			meta.setExpirationTime(expire);
		}
		if(cl!=""){
			meta.setContentLength(Long.parseLong(cl));
		}
		//content-language ??
		
		obj.setObjectMetadata(meta);
		
		client.putObject(bucket, key, objectContent, meta);

	}

}
