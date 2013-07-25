package com.oss.operations;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.aliyun.openservices.oss.OSSClient;

@SuppressWarnings("serial")
public class UploadFiles extends HttpServlet{
	private List<Thread> threadList = new ArrayList<Thread>();
			
	public UploadFiles(){
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		OSSClient client = (OSSClient) req.getSession().getAttribute("OSSClient");
		String bucketName = req.getParameter("bucket");
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			List<FileItem> items = upload.parseRequest(req);
			int num = items.size()-1;
			
			for (int i = 0; i < num; i++) {
				File f = new File("."+i);
				String file = items.get(i).getName();
				try {
					items.get(i).write(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				threadList.add(i, new Thread(new Upload(client, f, bucketName, file)));
				threadList.get(i).start();
			}

			RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp"); 
			try{
				dispatcher.forward(req, resp);
				return;
			}catch(Exception e){
				e.printStackTrace();
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
	}
	
	// TODO Ìí¼Ódwr·½·¨
	public void pause(String num){
		try {
			threadList.get(Integer.parseInt(num)).wait();
		} catch (NumberFormatException | InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	public void resume(String num){
		threadList.get(Integer.parseInt(num)).notify();
	}
	
	public void cancel(String num){
		threadList.get(Integer.parseInt(num)).interrupt();
	}
}
