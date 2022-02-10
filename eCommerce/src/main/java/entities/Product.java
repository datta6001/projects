package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ManyToAny;
@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pName;
	@Column(length = 3000)
	private String pDescription;
	private String pPhoto;
	private int pPrice;
	private int pDiscount;
	private int pQuantity;
	
	@ManyToOne
	private Category category;
	
	public Product() {
		super();
	}
	public Product(String pName, String pDescription, String pPhoto, int pPrice, int pDiscount, int pQuantity,Category category) {
		super();
		this.pName = pName;
		this.pDescription = pDescription;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category=category;
	}
	public int getpId() {
		return pId;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpDescription() {
		return pDescription;
	}
	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}
	public String getpPhoto() {
		return pPhoto;
	}
	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}
	public int getpQuantity() {
		return pQuantity;
	}
	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}
	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pDescription=" + pDescription + ", pPhoto=" + pPhoto
				+ ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + "]";
	}

}
