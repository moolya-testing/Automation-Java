package moolya.embibe.tests.web.old;

import java.net.URL;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

public class BrowserStackTest {

	public static final String USERNAME = "shaileshgupta1";
	  public static final String AUTOMATE_KEY = "AuzcDy9nAfBMj5BbSxhp";
	  public static final String URL = "https://" + USERNAME + ":" + AUTOMATE_KEY + "@hub-cloud.browserstack.com/wd/hub";

	  public static void main(String[] args) throws Exception {

	    DesiredCapabilities caps = new DesiredCapabilities();
	    caps.setCapability("browser", "Chrome");
	    caps.setCapability("browser_version", "52.0");
	    caps.setCapability("os", "Windows");
	    caps.setCapability("os_version", "7");
	    caps.setCapability("resolution", "1366x768");
	    caps.setCapability("browserstack.debug", "true");
	    caps.setCapability("acceptSslCerts", "true");
	    
	    

	    WebDriver driver = new RemoteWebDriver(new URL(URL), caps);
	    driver.get("http://www.google.com");
	    WebElement element = driver.findElement(By.name("q"));

	    element.sendKeys("BrowserStack");
	    element.submit();

	    System.out.println(driver.getTitle());
	    driver.quit();

	  }
}
