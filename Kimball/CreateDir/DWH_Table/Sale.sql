CREATE TABLE `test_kinball`.`Sale` (
  `Date_key` INT NOT NULL,
  `Category_key` INT NOT NULL,
  `Stories_key` INT NOT NULL,
  `Official_tweet_key` INT NOT NULL,
  `Sale_number` INT NULL,
  `Sale_number_count` INT NULL,
  PRIMARY KEY (`Date_key`, `Official_tweet_key`, `Stories_key`, `Category_key`),
  INDEX `fk_Sale_2_idx` (`Category_key` ASC),
  INDEX `fk_Sale_3_idx` (`Stories_key` ASC),
  INDEX `fk_Sale_4_idx` (`Official_tweet_key` ASC),
  CONSTRAINT `fk_Sale_1`
    FOREIGN KEY (`Date_key`)
    REFERENCES `test_kinball`.`Date` (`Date_key`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_2`
    FOREIGN KEY (`Category_key`)
    REFERENCES `test_kinball`.`Category` (`Category_key`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_3`
    FOREIGN KEY (`Stories_key`)
    REFERENCES `test_kinball`.`Stories` (`Stories_key`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_4`
    FOREIGN KEY (`Official_tweet_key`)
    REFERENCES `test_kinball`.`Official_tweet` (`Official_tweet_key`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
