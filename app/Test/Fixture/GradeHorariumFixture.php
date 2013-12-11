<?php
/**
 * GradeHorariumFixture
 *
 */
class GradeHorariumFixture extends CakeTestFixture {

/**
 * Table name
 *
 * @var string
 */
	public $table = '__gradeHoraria';

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'gradeHoraria_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'key' => 'primary'),
		'link' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 128, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'indexes' => array(
			'PRIMARY' => array('column' => 'gradeHoraria_id', 'unique' => 1)
		),
		'tableParameters' => array('charset' => 'utf8', 'collate' => 'utf8_general_ci', 'engine' => 'InnoDB')
	);

/**
 * Records
 *
 * @var array
 */
	public $records = array(
		array(
			'gradeHoraria_id' => 1,
			'link' => 'Lorem ipsum dolor sit amet'
		),
	);

}
