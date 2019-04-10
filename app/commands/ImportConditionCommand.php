<?php
namespace App\Console;

use Nette\Utils\Arrays;
use Nette\Utils\Finder;
use Nette\Utils\Image;
use Nette\Utils\Json;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Helper\ProgressBar;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Tracy\Debugger;

class ImportConditionCommand extends Command{

	/** @var \App\Model\Options @inject*/
	public $options;

	public $model;

	protected function configure(){
        $this->setName('database:importCondition')
	        ->setDescription('Load conditions form .json files to database')
	        ->addArgument('version',InputArgument::OPTIONAL, 'Specify version of game')
	        ->addArgument('files',InputArgument::IS_ARRAY, 'Name of file to load (separate multiple names with a space)');
    }

	protected function execute(InputInterface $input, OutputInterface $output){
		Debugger::enable(Debugger::DEVELOPMENT);

	    $version = $input->getArgument('version');
	    if (!$version) $version = $this->options->getDefaultVersion();
		$this->model = $this->getHelper('container')->getByType($this->options->getModelName($version));

	    $files = $input->getArgument('files');
	    if (!$files) $files = 'actorconditions*.json';

	    $inDir = $this->options->resDir.'/'.$version.'/raw/';

		$finder = Finder::findFiles($files)
			->exclude('*_debug*')
			->in($inDir);

	    $fileCount = iterator_count($finder->getIterator());

	    $this->model->getDatabase()->beginTransaction();
		$this->model->deleteTable($this->model->getConditions()->getName());

		$itemCount = 0;
	    foreach($finder as $file){
			$filename = $file->getFilename();

		    $json = file_get_contents($inDir.$filename);
		    $items = Json::decode($json,Json::FORCE_ARRAY);
			$count = count($items);

		    $bar = new ProgressBar($output, $count);
		    $bar->setFormat(' %current%/%max% [%bar%] %percent:3s%% %message%');
		    $bar->setMessage($filename);
		    $bar->start();

		    foreach ($items as $item) {
			    $bar->advance();

			    if ((array_key_exists('abilityEffect',$item))and(is_array($item['abilityEffect']))){
				    ParseUtils::expandArrayKey($item['abilityEffect'],'increaseAttackDamage');
				    $item = $item + $item['abilityEffect'];
			    }

				if (!array_key_exists('isPositive', $item) || !$item['isPositive']) $item['isPositive'] = 0;

			    $item = ParseUtils::JsonArray($item);
			    $item['filename'] = $filename;

				//$output->writeln($filename);
			    $this->model->getConditions()->insert($item);
		    }
		    $bar->finish();
	        $output->writeln('');
		    $itemCount += $count;
		}

	    $this->model->getDatabase()->commit();

	    $output->writeln('');
	    $output->writeln('<info>Finished importing '.$itemCount.' conditions in '.$fileCount.' json files</info>');

        return 0; // zero return code means everything is ok
    }
}
