CREATE TABLE IF NOT EXISTS `MyBD`.`animals` (
`id_animal` INT NOT NULL,
`name_a` VARCHAR(45) NULL,
`nickname_if_exist` VARCHAR(45) NULL,
`breed` VARCHAR(45) NULL,
`age` INT NULL,
`sex` VARCHAR(45) NULL,
`animal_category_id` INT NULL,
`animalscol` VARCHAR(45) NULL,
PRIMARY KEY (`id_animal`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `MyBD`.`list_item` (
`id_an_tr` INT NOT NULL,
`workers_id` INT NULL,
`animals_id` INT NULL,
`animals_id_animal` INT NOT NULL,
PRIMARY KEY (`id_an_tr`, `animals_id_animal`),
INDEX `fk_list_item_animals1_idx` (`animals_id_animal` ASC) VISIBLE,
CONSTRAINT `fk_list_item_animals1`
FOREIGN KEY (`animals_id_animal`)
REFERENCES `MyBD`.`animals` (`id_animal`)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MyBD`.`worker_and_tool` (
`id` INT NOT NULL,
`worker_id` INT NULL,
`tool_id` INT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `MyBD`.`workers` (
`id_worker` INT NOT NULL,
`name_w` VARCHAR(45) NULL,
`surname` VARCHAR(45) NULL,
`salary` VARCHAR(45) NULL,
`years_of_work` VARCHAR(45) NULL,
`category_id` VARCHAR(45) NULL,
`list_item_id_an_tr` INT NOT NULL,
`worker_and_tool_id` INT NOT NULL,
PRIMARY KEY (`id_worker`, `list_item_id_an_tr`, `worker_and_tool_id`),
INDEX `fk_workers_list_item1_idx` (`list_item_id_an_tr` ASC) VISIBLE,
INDEX `fk_workers_worker_and_tool1_idx` (`worker_and_tool_id` ASC) VISIBLE,
CONSTRAINT `fk_workers_list_item1`
FOREIGN KEY (`list_item_id_an_tr`)
REFERENCES `MyBD`.`list_item` (`id_an_tr`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_workers_worker_and_tool1`
FOREIGN KEY (`worker_and_tool_id`)
REFERENCES `MyBD`.`worker_and_tool` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `MyBD`.`category_workers` (
`id_category` INT NOT NULL,
`professia` VARCHAR(45) NULL,
`workers_id_worker` INT NOT NULL,
PRIMARY KEY (`id_category`, `workers_id_worker`),
INDEX `fk_category_workers_workers_idx` (`workers_id_worker` ASC) VISIBLE,
CONSTRAINT `fk_category_workers_workers`
FOREIGN KEY (`workers_id_worker`)
REFERENCES `MyBD`.`workers` (`id_worker`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `MyBD`.`tools` (
`id_tools` INT NOT NULL,
`name_t` VARCHAR(45) NULL,
`quantity_t` VARCHAR(45) NULL,
`cost` VARCHAR(45) NULL,
`material` VARCHAR(45) NULL,
`worker_and_tool_id` INT NOT NULL,
PRIMARY KEY (`id_tools`, `worker_and_tool_id`),
INDEX `fk_tools_worker_and_tool1_idx` (`worker_and_tool_id` ASC) VISIBLE,
CONSTRAINT `fk_tools_worker_and_tool1`
FOREIGN KEY (`worker_and_tool_id`)
REFERENCES `MyBD`.`worker_and_tool` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `MyBD`.`animals_category` (
`id_a_c` INT NOT NULL,
`individuals_of_the_animals` VARCHAR(45) NULL,
`animals_id_animal` INT NOT NULL,
PRIMARY KEY (`id_a_c`, `animals_id_animal`),
INDEX `fk_animals_category_animals1_idx` (`animals_id_animal` ASC) VISIBLE,
CONSTRAINT `fk_animals_category_animals1`
FOREIGN KEY (`animals_id_animal`)
REFERENCES `MyBD`.`animals` (`id_animal`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;