<?php 

class SigaCrawlerShell extends AppShell {

	public function startup() {
		$this->out("<info>Welcome to SigaCrawler Shell</info>");

		$this->hr(1);

		/*$this->out($this->wrapText(
			'<comment>This Shell is responsible for many tasks related to the Crawling of data from original SIGA database. It works based on curl 3rd-party library to connect to the original SIGA interface and extract contents based on original DOM library from PHP. The process of content extraction is mostly hard-coded and should be broken by small changes on original SIGA markup(one update is previewed to early 2014). Constant testing and code-refactoring may be necessary to this Shell keep alive.
			</comment>',
            array('indent'=>'		'))); */
    }

	public function save_gradeHoraria() {

		$this->SigaHandler = $this->Tasks->load('SigaHandler');
		$this->SigaHandler->save_gradeHoraria();

    }

    public function do_courses() {
        $this->SigaHandler = $this->Tasks->load('SigaHandler');
        $this->SigaHandler->do_courses();
    }

}

?>
