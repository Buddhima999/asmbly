//CA01--------------------------------------------------------------------------------------------------------------------------

package CA01;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.Select;

public class CA01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "D:\\Download\\chromedriver-win64\\chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		driver.get("file:///D:/Download/registration_form.html");
		driver.manage().window().maximize();
		driver.findElement(By.name("fullName")).sendKeys("Test User");
		driver.findElement(By.name("email")).sendKeys("test@gmail.com");
		driver.findElement(By.name("password")).sendKeys("Test@123");
		driver.findElement(By.name("mobile")).sendKeys("1234567890");
		driver.findElement(By.xpath("//*[@id=\"genderMale\"]")).click();
		driver.findElement(By.xpath("//*[@id=\"hobbyReading\"]")).click();
		Select option=new Select(driver.findElement(By.id("country")));
		option.selectByVisibleText("Sri Lanka");
		WebElement action=driver.findElement(By.xpath("//*[@id=\"experience\"]"));
		Actions move=new Actions(driver);
		move.dragAndDropBy(action, 40,0).perform();
		driver.findElement(By.xpath("//*[@id=\"dob\"]")).sendKeys("21-02-2022");
		driver.findElement(By.id("submitBtn")).click();
		
	}

}
---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------


//CA02---------------------------------------------------------------------------------------------------------------------------------------------------------

package studentuser1;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class student_test {

	public static WebDriver driver;
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		lanuch();
		adminLogin();
		sideMenu();
		Search();
		addNewStudent();
		DeleteStudent();
		UpdateStudent();
		Logout();
	}
	public static void lanuch() throws Exception{
		System.setProperty("webdriver.chrome.driver", "D:\\Download\\chromedriver-win64\\chromedriver.exe");
		driver=new ChromeDriver();
		driver.get("http://localhost/student");
		Thread.sleep(1000);
	}
	public static void adminLogin() throws Exception{
		driver.get("http://localhost/student/admin/index.php");
		driver.findElement(By.xpath("//*[@id=\"login-frm\"]/div[1]/input")).sendKeys("Sample");
		driver.findElement(By.xpath("//*[@id=\"login-frm\"]/div[2]/input")).sendKeys("sample123");
		String value=driver.findElement(By.xpath("//*[@id=\"login-frm\"]/div[2]/input")).getAttribute("value");
		String value1=driver.findElement(By.xpath("//*[@id=\"login-frm\"]/div[2]/input")).getAttribute("value");
		if(value.isEmpty()) {
			System.out.println("username is empty");
		}
		else if(value1.isEmpty()) {
			System.out.println("password is empty");
		}
		else {
		driver.findElement(By.xpath("//*[@id=\"login-frm\"]/button[1]")).click();
		Thread.sleep(1000);
		}
		
	}
	public static void sideMenu() throws Exception{
		driver.findElement(By.xpath("//*[@id=\"Employee\"]")).click();
		String currentUrl=driver.getCurrentUrl();
		String expectedUrl="http://localhost/student/admin/student.php";
		if(currentUrl.equals(expectedUrl)) {
			System.out.println("URL Validation Success");
		}
		else {
			System.out.println("URL validation Fail");
		}
	}
	
	public static void Search() throws Exception{
		Thread.sleep(1000);
		driver.findElement(By.xpath("//*[@id=\"Employee\"]")).click();
		driver.findElement(By.xpath("//*[@id=\"table_filter\"]/label/input")).sendKeys("Ad");
	}
	public static void addNewStudent() throws Exception{
		Thread.sleep(1000);
		driver.findElement(By.xpath("//*[@id=\"new_std_btn\"]")).click();
		Thread.sleep(1000);
		driver.findElement(By.xpath("//*[@id=\"new_student\"]/div/div/form/div[1]/div[1]/input[2]")).sendKeys("Stanely");
		driver.findElement(By.xpath("//*[@id=\"new_student\"]/div/div/form/div[1]/div[3]/input")).sendKeys("Lambert");
		driver.findElement(By.xpath("//*[@id=\"new_student\"]/div/div/form/div[1]/div[4]/input")).sendKeys("Grade11");
		driver.findElement(By.xpath("//*[@id=\"new_student\"]/div/div/form/div[1]/div[5]/input")).sendKeys("0777889090");
		driver.findElement(By.xpath("//*[@id=\"new_student\"]/div/div/form/div[2]/button")).click();
		Thread.sleep(1000);
		Alert alert=driver.switchTo().alert();
		System.out.println("Student Saving Alert Message is:"+alert.getText());
		alert.accept();
	}
	public static void DeleteStudent() throws Exception{
		driver.findElement(By.xpath("//*[@id=\"table\"]/tbody/tr[1]/td[7]/center/button[2]")).click();
		Alert alert=driver.switchTo().alert();
		System.out.println("Student Deleting Alert Message is :"+alert.getText());
		alert.dismiss();
		Thread.sleep(2000);
		
	}
	public static void UpdateStudent() throws Exception{
		driver.findElement(By.xpath("//*[@id=\"table\"]/tbody/tr[6]/td[7]/center/button[1]")).click();
		Thread.sleep(2000);
		WebElement lastname=driver.findElement(By.xpath("//*[@id=\"new_student\"]/div/div/form/div[1]/div[3]/input"));
		Thread.sleep(2000);
		lastname.clear();
		Thread.sleep(2000);
		lastname.sendKeys("Sewwandi");
		driver.findElement(By.xpath("//*[@id=\"new_student\"]/div/div/form/div[2]/button")).click();
		Thread.sleep(1000);
		Alert alert=driver.switchTo().alert();
		System.out.println("Student Updating Alert Message is:"+alert.getText());
		alert.accept();
	}
	public static void  Logout() throws Exception{
		driver.findElement(By.xpath("/html/body/nav/div/div[2]/a")).click();
	}
}

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


//2020-2021 =>Q3

FirstTestNG.java-----------------------------
package Testbasic_Exam;

import org.testng.annotations.Test;

public class FirstTestNG {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	@Test
	public void registerAccount() {
		System.out.println("First register your account");
	}
	@Test
	public void sendEmail() {
		System.out.println("Send email after login");
	}
	@Test(dependsOnMethods= {"registerAccount"})
	public void login() {
		System.out.println("Login to the account after registration");
	}
	@Test
	public void homepage() {
		System.out.println("This is the home page");
	}
	@Test
	public void logout() {
		System.out.println("Logout current session");
	}

}
----------------------------------------------------------------

dependentClass.java--------------------------------------
package Testbasic_Exam;

import org.testng.annotations.Test;

public class dependentClass {

	@Test
	public void registerAccount() {
		System.out.println("First register your account");
	}
	@Test
	public void sendEmail() {
		System.out.println("Send email after login");
	}
	@Test(dependsOnMethods= {"registerAccount"})
	public void login() {
		System.out.println("Login to the account after registration");
	}
	@Test
	public void homepage() {
		System.out.println("This is the home page");
	}
	@Test(dependsOnMethods= {"login","homepage"})
	public void logout() {
		System.out.println("Logout current session");
	}
}
--------------------------------------------------------------------
SecondTestNG.java------------------
package Testbasic_Exam;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.Test;

public class SecondTestNG {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	@Test(invocationCount=3 ,threadPoolSize=3)
	public void googleOpen() {
		System.setProperty("webdriver.chrome.driver", "D:\\Download\\chromedriver-win64\\chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		driver.get("https://google.com");
		System.out.println("Google page is open");
	}

}
------------------------------------------------------------------
parrellel.xml-------------------
<?xml version="1.0" encoding="UTF-8"?>
<suite name="parellelSuite">
	<test name="parelleltest" parallel="classes" thread-count="2">
		<classes>
			<class name="Testbasic_Exam.dependentClass"/>
			<class name="Testbasic_Exam.SecondTestNG"/>
		</classes>
	</test>
</suite>
---------------------------------------------------------------------------
sequential.xml------------------------
<?xml version="1.0" encoding="UTF-8"?>
<suite name="SequnetialSuite">
	<test name="SequnentialTest">
		<classes>
			<class name="Testbasic_Exam.dependentClass"/>
			<class name="Testbasic_Exam.SecondTestNG"/>
		</classes>
	</test>
</suite>
---------------------------------------


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------



2020-2021=>Q4
package user_demo;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class User {

	WebDriver driver;
	
	@BeforeTest
	public void loadUser() throws Exception {
		System.setProperty("webdiver.chrome.driver", "D:\\Download\\chromedriver-win64\\chromedrive.exe");
		driver=new ChromeDriver();
		driver.manage().window().maximize();
		driver.get("http://localhost/student/admin/index.php");
	}
	
	@Test(priority=1)	
	public void login() throws Exception  {
		driver.findElement(By.xpath("//*[@id=\"login-frm\"]/div[1]/input")).sendKeys("Sample");
		driver.findElement(By.xpath("//*[@id=\"login-frm\"]/div[2]/input")).sendKeys("sample123");
		driver.findElement(By.xpath("//*[@id=\"login-frm\"]/button[1]")).click();
		Thread.sleep(1000);
		String current=driver.getCurrentUrl();
		if(current.equals("http://localhost/student/admin/home.php")) {
			System.out.println(" login Success");
		}
		else {
			System.out.println("Error Message Displayed");
           
		}
	}
	@Test(priority=2)
	public void search() throws Exception {
		Thread.sleep(1000);
		driver.findElement(By.xpath("//*[@id=\"Employee\"]")).click();
		driver.findElement(By.xpath("//*[@id=\"table_filter\"]/label/input")).sendKeys("Bob");
		String name=driver.findElement(By.xpath("//*[@id=\"table\"]/tbody/tr/td[2]")).getText();
		if(name.equals("Bob")) {
			System.out.println("data detected");
		}
		else {
			System.out.println("data detected");
		}
	}
	@Test(priority=3)
	public void updateUser() throws Exception {
		Thread.sleep(2000);
		driver.findElement(By.xpath("//*[@id=\"table\"]/tbody/tr/td[7]/center/button[1]")).click();
		Thread.sleep(2000);
        driver.findElement(By.xpath("//*[@id=\"new_student\"]/div/div/div/button")).click();
	}
	@Test(priority=4)
	public void addNewUser() throws Exception {
		driver.findElement(By.xpath("//*[@id=\"new_std_btn\"]")).click();
		Thread.sleep(2000);
		driver.findElement(By.xpath("//*[@id=\"new_student\"]/div/div/div/button")).click();
	}
	@Test(priority=5)
	public void logout() {
		driver.findElement(By.xpath("/html/body/nav/div/div[2]/a")).click();
	}
}
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Array drop down
public static void clickDropDown() {
		Select select=new Select(driver.findElement(By.name("table_length")));
		select.selectByIndex(2);
		String option=select.getFirstSelectedOption().getText();
		System.out.println(option);
		
		
	}
