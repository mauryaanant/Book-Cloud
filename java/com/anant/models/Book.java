package com.piyush.models;




import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Entity


//----lombok
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Book {
	@Id
	private String name;
	private int price;
	private String aname;
	private String pname;
	private String description;
	private String category;
	@Lob
	@Column(nullable = false, columnDefinition ="longblob")
	private byte[] image;
	@Lob
	@Column(nullable = false, columnDefinition ="longblob")
	private byte[] content;
	
	
}