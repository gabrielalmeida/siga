<?php 

App::uses('Curl', 'Vendor');

class SigaHandlerTask extends Shell {
   
    public $uses = array('GradeHorarium');

    public function startup() {
    	Configure::write('debug', 2);
    }
 
 	private function _load_styles() {
 		$this->stdout->styles('correct', array('text' => 'green', 'bold' => true));
    	$this->stdout->styles('wrong', array('text' => 'magenta', 'blink' => true));
    
    }

    public function do_courses() {
        
        $this->_load_styles();

        $this->hr(2);

        $this->out('This is our do_disciplines() test'); // Here I should retrieve to DB each course info, but i dont have more time to live, thx ufrj i lov yNO.....
    }

    public function save_gradeHoraria() {
    	
    	$this->_load_styles();

    	$this->hr(2);

    	$this->out('<warning>Starting gradeHoraria Task:</warning>',2);

    	$this->out('<comment>This task is resposible for crawling gradeHoraria from siga and push it to our DB.</comment>',2);

    	$this->Curl = new Curl();
    	
    	$this->Curl->setopt(CURLOPT_FOLLOWLOCATION, TRUE);
    	$this->Curl->setopt(CURLOPT_AUTOREFERER, TRUE);
    	$this->Curl->setopt(CURLOPT_CONNECTTIMEOUT, 120);
    	$this->Curl->setopt(CURLOPT_TIMEOUT, 120);
    	$this->Curl->setopt(CURLOPT_SSL_VERIFYHOST, FALSE);
    	$this->Curl->setopt(CURLOPT_SSL_VERIFYPEER, FALSE);

    	$this->Curl->get('https://siga.ufrj.br/sira/gradeHoraria/');

    	if($this->Curl->error) {
	    	$this->out(__d('cake_console','		<error>cURL at gradeHoraria</error> - <wrong>ERROR: #%s</wrong>',$this->Curl->error_code));
    	} else {
	    	$this->out(__d('cake_console','		<info>cURL at gradeHoraria</info> - <correct>OK √</correct>'));
    	}

    	$this->out('', 3);

    	libxml_use_internal_errors(true); // We don't need PHP warning/errors everywhere

    	// DomDocument lib used to parse HTML
		$dom = new DOMDocument;
		$dom->loadHTML($this->Curl->response);
		
		// Trough XPath
		$xpath = new DOMXPath($dom);
		$node = $xpath->query("//tr/td[2]"); // Select all links poiting to discipline`s curriculums
		
		foreach($node as $n) {
			$href = $n->nodeValue;

			$gradeHoraria_baseURL = 'https://siga.ufrj.br/sira/gradeHoraria/';

			if($href != 'Parent Directory') { // Avoid the first DOM element Parent Directory

				$href = $gradeHoraria_baseURL.$href;
				if($this->GradeHorarium->findByLink($href)) {

					// GradeHorarium already on DB, just update 'modified' time
					$this->GradeHorarium->updateAll(array('modified' => 'NOW()'), array('link' => $href));
					$this->out(__d('cake_console',$href.' - <correct>Time updated √</correct>'));
				} else {

					$this->GradeHorarium->create();
					$this->GradeHorarium->save(array('link' => $href));
					$this->out(__d('cake_console',$href.' - <correct>New item inserted √</correct>'));
				}
			}
		}


		libxml_clear_errors(); // clear internal errors to avoid future memory troubles
        
    	$this->out(__d('cake_console', '<warning>End of gradeHoraria Task!</warning>'));

    }
}
 ?>
