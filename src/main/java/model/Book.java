package model;

public class Book {

	private int id;
	private String title;
	private String authorName;
	private String publisherName;
	private String category;
	private String edition;
	private int publicationYear;
	private double price;
	private int availableQuantity;
	
	public Book() {}
	
	public Book(int id, String title, String authorName, String publisherName, String category, String edition,
			int publicationYear, double price, int availableQuantity) {
		this.id = id;
		this.title = title;
		this.authorName = authorName;
		this.publisherName = publisherName;
		this.category = category;
		this.edition = edition;
		this.publicationYear = publicationYear;
		this.price = price;
		this.availableQuantity = availableQuantity;
	}

	public int getBookId() { return id; }
	public String getBookTitle() { return title; }
	public String getAuthorName() { return authorName; }
	public String getPublisherName() { return publisherName; }
	public String getCategory() { return category; }
	public String getEdition() { return edition; }
	public int getPublicationYear() { return publicationYear; }
	public double getPrice() { return price; }
	public int getAvailableQuantity() { return availableQuantity; }

	public void setBookId(int id) { this.id = id; }
	public void setBookTitle(String title) { this.title = title; }
	public void setAuthorName(String authorName) { this.authorName = authorName; }
	public void setPublisherName(String publisherName) { this.publisherName = publisherName; }
	public void setCategory(String category) { this.category = category; }
	public void setEdition(String edition) { this.edition = edition; }
	public void setPublicationYear(int publicationYear) { this.publicationYear = publicationYear; }
	public void setPrice(double price) { this.price = price; }
	public void setAvailableQuantity(int availableQuantity) { this.availableQuantity = availableQuantity; }
}