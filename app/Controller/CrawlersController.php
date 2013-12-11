<?php 

class CrawlersController extends AppController {

	public $components = array('Siga');

	function courses() {

		/*$html = $this->Siga->get_content('https://siga.ufrj.br/sira/repositorio-curriculo/disciplinas');

		libxml_use_internal_errors(true);

		$dom = new DOMDocument;
		$dom->loadHTML($html);
		$xpath = new DOMXPath($dom);
		$node = $xpath->query("//tr/td[2]");
		$href = array();
		foreach($node as $n) {
			$href[] = $n->nodeValue;
		}

		libxml_clear_errors();

		var_dump($href);*/
	}

}

 ?>