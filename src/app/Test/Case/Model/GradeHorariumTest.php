<?php
App::uses('GradeHorarium', 'Model');

/**
 * GradeHorarium Test Case
 *
 */
class GradeHorariumTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.grade_horarium'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->GradeHorarium = ClassRegistry::init('GradeHorarium');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->GradeHorarium);

		parent::tearDown();
	}

}
