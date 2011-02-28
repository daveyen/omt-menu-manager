package menu.manager

import grails.test.*

import org.codehaus.groovy.grails.plugins.codecs.*

class AdminControllerTests extends ControllerUnitTestCase {

	protected void setUp() {
		super.setUp()
		
	}

	void testIndex() {
		controller.index()
		assertEquals "home",
				controller.redirectArgs["action"]
		}



	protected void tearDown() {
		super.tearDown()
	}

}
