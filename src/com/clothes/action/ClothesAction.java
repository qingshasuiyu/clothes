package com.clothes.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.clothes.dao.ClothesDao;
import com.clothes.model.Customer;
import com.clothes.model.Clothes;

@Controller @Scope("prototype")
public class ClothesAction {
	@Resource ClothesDao clothesDAO;
	private Clothes clothes;
	private List<Clothes> clothesList;
	private Customer customer;
	private String keywords;
	private File clothesPhoto;
    private String clothesPhotoFileName;
    private String clothesPhotoContentType;
	
	
	public File getClothesPhoto() {
		return clothesPhoto;
	}

	public void setClothesPhoto(File clothesPhoto) {
		this.clothesPhoto = clothesPhoto;
	}

	public String getClothesPhotoFileName() {
		return clothesPhotoFileName;
	}

	public void setClothesPhotoFileName(String clothesPhotoFileName) {
		this.clothesPhotoFileName = clothesPhotoFileName;
	}

	public String getClothesPhotoContentType() {
		return clothesPhotoContentType;
	}

	public void setClothesPhotoContentType(String clothesPhotoContentType) {
		this.clothesPhotoContentType = clothesPhotoContentType;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<Clothes> getClothesList() {
		return clothesList;
	}

	public void setClothesList(List<Clothes> clothesList) {
		this.clothesList = clothesList;
	}

	public Clothes getClothes() {
		return clothes;
	}

	public void setClothes(Clothes clothes) {
		this.clothes = clothes;
	}
	/*添加衣服*/
	public String addClothes() throws Exception{
		String path = ServletActionContext.getServletContext().getRealPath("/img"); 
        /*处理图片上传*/
        String clothesPhotoFileName = ""; 
   	 	if(clothesPhoto!= null) {
   	 		InputStream is = new FileInputStream(clothesPhoto);
   			String fileContentType = this.getClothesPhotoContentType();
   			System.out.println(fileContentType);
   			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
   				clothesPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
   			else if(fileContentType.equals("image/gif"))
   				clothesPhotoFileName = UUID.randomUUID().toString() +  ".gif";
   			else if(fileContentType.equals("image/png"))
   				clothesPhotoFileName = UUID.randomUUID().toString() +  ".png";

   			File file = new File(path, clothesPhotoFileName);
   			OutputStream os = new FileOutputStream(file);
   			byte[] b = new byte[1024];
   			int bs = 0;
   			while ((bs = is.read(b)) > 0) {
   				os.write(b, 0, bs);
   			}
   			is.close();
   			os.close();
   	 	}
        if(clothesPhoto != null)
        	clothes.setFilepath("img/" + clothesPhotoFileName);
        else
        	clothes.setFilepath("img/NoImage.jpg");
		clothesDAO.AddClothes(clothes);
		return "message";
	}
	/*显示所有衣服*/
	public String showClothes(){
		clothesList=clothesDAO.QueryAllClothes();
		return "show_view";
	}
	//查询衣服
	public String queryClothes() throws Exception{
		clothesList=clothesDAO.QueryClothesInfo(keywords);
		return "show_view";
	}
	/*显示衣服信息*/
	public String showDetail(){
		clothes=clothesDAO.GetClothesById(clothes.getClothesid());
		return "detail_view";
	}
	/*显示修改项*/
	public String showEdit() throws Exception {
		clothes = clothesDAO.GetClothesById(clothes.getClothesid());
		return "edit_view";
	}
	//编辑衣服
	public String editClothes() throws Exception{
		String path = ServletActionContext.getServletContext().getRealPath("/img"); 
        /*处理图片上传*/
        String clothesPhotoFileName = ""; 
   	 	if(clothesPhoto!= null) {
   	 		InputStream is = new FileInputStream(clothesPhoto);
   			String fileContentType = this.getClothesPhotoContentType();
   			System.out.println(fileContentType);
   			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
   				clothesPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
   			else if(fileContentType.equals("image/gif"))
   				clothesPhotoFileName = UUID.randomUUID().toString() +  ".gif";
   			else if(fileContentType.equals("image/png"))
   				clothesPhotoFileName = UUID.randomUUID().toString() +  ".png";

   			File file = new File(path, clothesPhotoFileName);
   			OutputStream os = new FileOutputStream(file);
   			byte[] b = new byte[1024];
   			int bs = 0;
   			while ((bs = is.read(b)) > 0) {
   				os.write(b, 0, bs);
   			}
   			is.close();
   			os.close();
   	 	}
        if(clothesPhoto != null)
        	clothes.setFilepath("img/" + clothesPhotoFileName);
        else
        	clothes.setFilepath("img/NoImage.jpg");
		
		clothesDAO.UpdateClothes(clothes);
		return "edit_message";
	}
	//删除衣服信息
	public String deleteClothes() throws Exception{
		clothesDAO.DeleteClothes(clothes.getClothesid());
		return "delete_message";
	}
}
