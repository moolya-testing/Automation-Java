package moolya.embibe.tests.web.functional.searchHomePage;

import java.awt.AWTException;
import java.io.IOException;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.testng.Reporter;
import org.testng.annotations.Test;

import moolya.embibe.pages.web.LandingPage;
import moolya.embibe.pages.web.SearchHomepage;
import moolya.embibe.pages.web.W_BasePage;
import moolya.embibe.tests.web.W_BaseTest;

public class SHP_Func_8 extends W_BaseTest {

	private W_BasePage basepage;
	private LandingPage lp;
	
	private SearchHomepage shp;
	
	{
		uniqueValue = "Sanity_3";
	}
	
	@Test(dataProvider="browserData")
	public void SHP_Func_8_Test(String browser) throws IOException, EncryptedDocumentException, InvalidFormatException, InterruptedException, AWTException{
		basepage = new W_BasePage(wdriver);
		wdriver = basepage.launchWebApp(browser);
		Reporter.log("Starting Test: Functional : Search Home Page : SHP_Func_8 ", true);
		lp = new LandingPage(wdriver);
		lp.waitForLandingPageToLoad();
		lp.assertLandingPage();
		Reporter.log("User is navigated to Landing Page successfully", true);
		shp = lp.clickStartNow();
		shp.assertSearchHomepage();
		shp.searchInNewTab(uniqueValue);
	}
}
