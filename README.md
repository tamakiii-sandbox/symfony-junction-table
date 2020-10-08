# symfony-junction-table

### tables
```sql
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `user_user_group` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`, `group_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_user_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_group_group_id` FOREIGN KEY (`group_id`) REFERENCES `user_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```

### Data
```sql
INSERT INTO user VALUES(NULL, 'John', NOW());
INSERT INTO user VALUES(NULL, 'Paul', NOW());
INSERT INTO user VALUES(NULL, 'Ringo', NOW());
INSERT INTO user VALUES(NULL, 'George', NOW());
INSERT INTO user VALUES(NULL, 'Charlie', NOW());

INSERT INTO user_group VALUES(NULL, 'The Beatles', NOW());
INSERT INTO user_group VALUES(NULL, 'The Yardbirds', NOW());

INSERT INTO user_user_group VALUES(1, 1);
INSERT INTO user_user_group VALUES(2, 1);
INSERT INTO user_user_group VALUES(3, 1);
INSERT INTO user_user_group VALUES(4, 1);
```
