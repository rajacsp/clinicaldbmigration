CREATE DATABASE  IF NOT EXISTS `rt4_clinical_3` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `rt4_clinical_3`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: rt4_clinical_3
-- ------------------------------------------------------
-- Server version	5.6.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'rt4_clinical_3'
--
/*!50003 DROP PROCEDURE IF EXISTS `addUnique` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUnique`()
BEGIN
	
	

	IF NOT EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS WHERE
			   CONSTRAINT_SCHEMA = DATABASE() AND
			   CONSTRAINT_NAME   = 'ocfvUnique' AND
			   CONSTRAINT_TYPE   = 'UNIQUE') THEN
		ALTER TABLE ObjectCustomFieldValues ADD CONSTRAINT ocfvUnique
						 UNIQUE (CustomField, ObjectType, ObjectId, Content);
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkMismatchedTickets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkMismatchedTickets`()
BEGIN
	select id from Tickets where effectiveId not in (select id from Tickets);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cleanAttachmentsTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cleanAttachmentsTable`()
BEGIN
	
	 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT ;
	 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS ;
	 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION ;
	 SET NAMES utf8 ;
	 SET @OLD_TIME_ZONE=@@TIME_ZONE ;
	 SET TIME_ZONE='+00:00' ;
	 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 ;
	 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 ;
	 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' ;
	 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 ;

	
	
	

	DROP TABLE IF EXISTS Attachments;
	 SET @saved_cs_client     = @@character_set_client ;
	 SET character_set_client = utf8 ;
	CREATE TABLE Attachments (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `TransactionId` int(11) NOT NULL,
	  `Parent` int(11) NOT NULL DEFAULT '0',
	  `MessageId` varchar(160) CHARACTER SET ascii DEFAULT NULL,
	  `Subject` varchar(255) DEFAULT NULL,
	  `Filename` varchar(255) DEFAULT NULL,
	  `ContentType` varchar(80) CHARACTER SET ascii DEFAULT NULL,
	  `ContentEncoding` varchar(80) CHARACTER SET ascii DEFAULT NULL,
	  `Content` longblob,
	  `Headers` longtext,
	  `Creator` int(11) NOT NULL DEFAULT '0',
	  `Created` datetime DEFAULT NULL,
	  PRIMARY KEY (`id`),
	  KEY `Attachments2` (`TransactionId`),
	  KEY `Attachments3` (`Parent`,`TransactionId`)
	) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
	 SET character_set_client = @saved_cs_client ;
	 SET TIME_ZONE=@OLD_TIME_ZONE ;

	 SET SQL_MODE=@OLD_SQL_MODE ;
	 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS ;
	 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS ;
	 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT ;
	 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS ;
	 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION ;
	 SET SQL_NOTES=@OLD_SQL_NOTES ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cleanTicketBundle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cleanTicketBundle`()
BEGIN
	call cleanTicketsTable(); 
	-- call cleanAttachmentsTable(); 
	delete from Transactions where ObjectType = 'RT::Ticket'; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cleanTicketsTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cleanTicketsTable`()
BEGIN
	 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT ;
	 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS ;
	 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION ;
	 SET NAMES utf8 ;
	 SET @OLD_TIME_ZONE=@@TIME_ZONE ;
	 SET TIME_ZONE='+00:00' ;
	 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 ;
	 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 ;
	 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' ;
	 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 ;

	
	
	

	DROP TABLE IF EXISTS Tickets;
	 SET @saved_cs_client     = @@character_set_client ;
	 SET character_set_client = utf8 ;
	CREATE TABLE Tickets (
		`id` int(11) NOT NULL AUTO_INCREMENT,
		`EffectiveId` int(11) NOT NULL DEFAULT '0',
		`Queue` int(11) NOT NULL DEFAULT '0',
		`Type` varchar(16) CHARACTER SET ascii DEFAULT NULL,
		`IssueStatement` int(11) NOT NULL DEFAULT '0',
		`Resolution` int(11) NOT NULL DEFAULT '0',
		`Owner` int(11) NOT NULL DEFAULT '0',
		`Subject` varchar(200) DEFAULT '[no subject]',
		`InitialPriority` int(11) NOT NULL DEFAULT '0',
		`FinalPriority` int(11) NOT NULL DEFAULT '0',
		`Priority` int(11) NOT NULL DEFAULT '0',
		`TimeEstimated` int(11) NOT NULL DEFAULT '0',
		`TimeWorked` int(11) NOT NULL DEFAULT '0',
		`Status` varchar(64) DEFAULT NULL,
		`TimeLeft` int(11) NOT NULL DEFAULT '0',
		`Told` datetime DEFAULT NULL,
		`Starts` datetime DEFAULT NULL,
		`Started` datetime DEFAULT NULL,
		`Due` datetime DEFAULT NULL,
		`Resolved` datetime DEFAULT NULL,
		`LastUpdatedBy` int(11) NOT NULL DEFAULT '0',
		`LastUpdated` datetime DEFAULT NULL,
		`Creator` int(11) NOT NULL DEFAULT '0',
		`Created` datetime DEFAULT NULL,
		`Disabled` smallint(6) NOT NULL DEFAULT '0',
		PRIMARY KEY (`id`),
		KEY `Tickets1` (`Queue`,`Status`),
		KEY `Tickets2` (`Owner`),
		KEY `Tickets6` (`EffectiveId`,`Type`)
	) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
	 SET character_set_client = @saved_cs_client ;
	 SET TIME_ZONE=@OLD_TIME_ZONE ;

	 SET SQL_MODE=@OLD_SQL_MODE ;
	 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS ;
	 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS ;
	 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT ;
	 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS ;
	 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION ;
	 SET SQL_NOTES=@OLD_SQL_NOTES ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `copyCustomFieldsForMedication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `copyCustomFieldsForMedication`()
BEGIN

	DECLARE log_finished INTEGER DEFAULT 0;

	DECLARE log_id INT(11);
	DECLARE created_by INT(11);
	DECLARE created_at DATETIME;
	DECLARE resolved_at DATETIME;
	DECLARE resolved_by INT(11);
	
	DECLARE medication VARCHAR(255);
	 
    
    DEClARE custom_cursor CURSOR FOR 
        SELECT
			
			logs.id as 'log_id',
			logs.created_by,
			logs.created_at,
			logs.resolved_at,
			logs.resolved_by,

			
			drugs.name as 'medication' 

		FROM satlog.logs logs

		left join satlog.medication_logs as medication_logs on medication_logs.log_id = logs.id
		left join satlog.drugs as drugs on medication_logs.drug_id = drugs.id

		where
		drugs.name is not null
		
		order by logs.id;
 
		
		DECLARE CONTINUE HANDLER 
			FOR NOT FOUND SET log_finished = 1;
				
		OPEN custom_cursor;
 
    get_log: LOOP		
	
		
		FETCH custom_cursor INTO log_id, created_by, created_at, resolved_at, resolved_by,			
		
			medication
		;
 
        IF log_finished = 1 THEN 
            LEAVE get_log;
        END IF;

		
		
		IF resolved_at is null THEN
			SET resolved_at = created_at;
		END IF;		

		
		IF resolved_by is null THEN
			SET resolved_by = created_by;
		END IF;		

		
		CALL getClinicalOwnerId(created_by);

		
		CALL getClinicalOwnerId(resolved_by);

        

		call createCustomFieldValuesForMedication(
			log_id, created_by, created_at, resolved_by, resolved_at,
			
			medication
		);
 
    END LOOP get_log;
 
    CLOSE custom_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `copyCustomFieldsForProgramPhases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `copyCustomFieldsForProgramPhases`()
BEGIN

	DECLARE log_finished INTEGER DEFAULT 0;

	DECLARE log_id INT(11);
	DECLARE created_by INT(11);
	DECLARE created_at DATETIME;
	DECLARE resolved_at DATETIME;
	DECLARE resolved_by INT(11);
	
	DECLARE programPhase VARCHAR(255);
	 
    
    DEClARE custom_cursor CURSOR FOR 
        SELECT
			
			logs.id as 'log_id',
			logs.created_by,
			logs.created_at,
			logs.resolved_at,
			logs.resolved_by,

			
			hm_program_phases.value as 'programPhase' 

		FROM satlog.logs logs

		left join satlog.hm_program_phases as hm_program_phases on logs.hm_program_phase_id = hm_program_phases.id

		where
		hm_program_phases.value is not null
		
		order by logs.id;
 
		
		DECLARE CONTINUE HANDLER 
			FOR NOT FOUND SET log_finished = 1;
				
		OPEN custom_cursor;
 
    get_log: LOOP		
	
		
		FETCH custom_cursor INTO log_id, created_by, created_at, resolved_at, resolved_by,			
		
			programPhase
		;
 
        IF log_finished = 1 THEN 
            LEAVE get_log;
        END IF;

		
		
		IF resolved_at is null THEN
			SET resolved_at = created_at;
		END IF;		

		
		IF resolved_by is null THEN
			SET resolved_by = created_by;
		END IF;		

		
		CALL getClinicalOwnerId(created_by);

		
		CALL getClinicalOwnerId(resolved_by);

        

		call createCustomFieldValuesForProgramPhase(
			log_id, created_by, created_at, resolved_by, resolved_at,
			
			programPhase
		);
 
    END LOOP get_log;
 
    CLOSE custom_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `copyCustomFieldsWithoutMedication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `copyCustomFieldsWithoutMedication`()
BEGIN

	DECLARE log_finished INTEGER DEFAULT 0;

	DECLARE log_id INT(11);
	DECLARE created_by INT(11);
	DECLARE created_at DATETIME;
	DECLARE resolved_at DATETIME;
	DECLARE resolved_by INT(11);

	DECLARE category VARCHAR(255);
	DECLARE centre_ext_id VARCHAR(255);
	DECLARE centre_phone VARCHAR(255);
	DECLARE centre_email VARCHAR(255);
	DECLARE centre_address VARCHAR(255);
	DECLARE caller_name VARCHAR(255);
	DECLARE client_first_name VARCHAR(255);
	DECLARE client_last_name VARCHAR(255);
	DECLARE gender_int INT(11);
	DECLARE gender VARCHAR(255) DEFAULT 'female';
	DECLARE age VARCHAR(255);
	DECLARE start_weight VARCHAR(255);
	DECLARE current_weight VARCHAR(255);
	DECLARE goal_weight VARCHAR(255);
	DECLARE qlp_program VARCHAR(255);
	DECLARE product VARCHAR(255);
	DECLARE dosage VARCHAR(255);
	DECLARE medical_history VARCHAR(255);
	DECLARE resolution LONGBLOB;	
	 
    
    DEClARE custom_cursor CURSOR FOR 
        SELECT
			
			logs.id as 'log_id',
			logs.created_by,
			logs.created_at,
			logs.resolved_at,
			logs.resolved_by,

			
			categories.name as 'category', 
			logs.centre_ext_id, 
			'' as 'centre_phone', 
			'' as 'centre_email', 
			'' as 'centre_address', 
			concat(logs.caller_first_name, ' ', logs.caller_last_name) as 'caller_name', 
			logs.client_first_name, 
			logs.client_last_name, 
			logs.gender,  
			logs.age,  

			start_weights.value as 'start_weight',  
			current_weights.value as  'current_weight', 
			weight_loss_goals.value as 'goal_weight', 
	
			hm_programs.value as 'qlp_program', 
			hm_product.description as 'product', 
			hm_product_dosages.value as 'dosage', 
			
			diseases.name as 'medical_history', 
			resolution_notes.value as 'resolution' 

		FROM satlog.logs logs

		left join satlog.users as users on logs.created_by = users.id
		left join satlog.categories as categories on logs.category_id = categories.id
		left join satlog.call_questions as call_questions on logs.call_question_id = call_questions.id
		left join satlog.centre_actions_before_call as centre_actions_before_call on logs.centre_action_before_call_id = centre_actions_before_call.id
		left join satlog.clinical_support_responses as clinical_support_responses on logs.clinical_support_response_id = clinical_support_responses.id
		left join satlog.weight_loss_goals as weight_loss_goals on logs.weight_loss_goal_id = weight_loss_goals.id

		left join satlog.hm_programs as hm_programs on logs.hm_program_id = hm_programs.id
		left join satlog.hm_product_dosages as hm_product_dosages on logs.hm_product_dosage_id = hm_product_dosages.id

		left join satlog.hm_product_logs as hm_product_logs on hm_product_logs.log_id = logs.id
		left join satlog.hm_product as hm_product on hm_product_logs.hm_product_ext_id = hm_product.id

		left join satlog.medical_history_logs as medical_history_logs on logs.id = medical_history_logs.log_id
		left join satlog.diseases as diseases on medical_history_logs.disease_id = diseases.id

		left join satlog.hm_program_phases as hm_program_phases on logs.hm_program_phase_id = hm_program_phases.id
		left join satlog.resolution_notes as resolution_notes on logs.resolution_notes_id = resolution_notes.id

		left join satlog.current_weights as current_weights on logs.current_weight_id = current_weights.id
		left join satlog.current_weights as start_weights on logs.start_weight_id = start_weights.id

		-- where logs.id >=0 and logs.id <=50
		order by logs.id;
 
		
		DECLARE CONTINUE HANDLER 
			FOR NOT FOUND SET log_finished = 1;

		
		DELETE FROM ObjectCustomFieldValues WHERE ObjectType = 'RT::Ticket';

		
		IF NOT EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS WHERE
			   CONSTRAINT_SCHEMA = DATABASE() AND
			   CONSTRAINT_NAME   = 'ocfvUnique' AND
			   CONSTRAINT_TYPE   = 'UNIQUE') THEN
			ALTER TABLE ObjectCustomFieldValues ADD CONSTRAINT ocfvUnique
						 UNIQUE (CustomField, ObjectType, ObjectId, Content);
		END IF;
				
		OPEN custom_cursor;
 
    get_log: LOOP		
	
		
		FETCH custom_cursor INTO log_id, created_by, created_at, resolved_at, resolved_by,			
		
			category, centre_ext_id, centre_phone, centre_email, centre_address, 

			caller_name, client_first_name, client_last_name, gender_int, age,  
			start_weight, current_weight, goal_weight, 
			qlp_program, product, dosage, medical_history, resolution
		;
 
        IF log_finished = 1 THEN 
            LEAVE get_log;
        END IF;

		

		
		IF gender_int = 0 THEN
			SET gender = 'male';
		END IF;

		
		IF resolved_at is null THEN
			SET resolved_at = created_at;
		END IF;		

		
		IF resolved_by is null THEN
			SET resolved_by = created_by;
		END IF;		

		
		CALL getClinicalOwnerId(created_by);

		
		CALL getClinicalOwnerId(resolved_by);

        

		call createCustomFieldValuesWithoutMedication(
			log_id, created_by, created_at, resolved_by, resolved_at,
			
			category, centre_ext_id, centre_phone, centre_email, centre_address,
			caller_name, client_first_name, client_last_name, gender, age, start_weight,
			current_weight, goal_weight, qlp_program, product, dosage, medical_history, resolution
		);
 
    END LOOP get_log;
 
    CLOSE custom_cursor;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `copySatLogBasicTickets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `copySatLogBasicTickets`()
BEGIN

	DECLARE log_finished INTEGER DEFAULT 0;
	
	DECLARE log_id int(11) DEFAULT 0;
	DECLARE created_by int(11) DEFAULT 0;
	DECLARE created_at datetime DEFAULT '1970-01-01 00:00:00';
	DECLARE resolved_int smallint(6) DEFAULT 0;
	DECLARE status varchar(64) DEFAULT 'open';
	DECLARE resolved_at datetime DEFAULT '1970-01-01 00:00:00';
	DECLARE resolved_by int(11) DEFAULT 0;
	DECLARE category varchar(50) DEFAULT '';
	DECLARE called_at datetime DEFAULT '1970-01-01 00:00:00';
	DECLARE call_question longtext DEFAULT NULL;
	DECLARE center_action_before_call longtext DEFAULT NULL;
	DECLARE clinical_support_response longtext DEFAULT NULL;

	DECLARE content longblob DEFAULT '';

	
	
 
    
    DEClARE log_cursor CURSOR FOR 
        SELECT
			logs.id as 'log_id',
			logs.created_by,
			logs.created_at,
			logs.resolved,
			logs.resolved_at,
			logs.resolved_by,
			categories.name as 'category',
			logs.called_at,
			call_questions.value as 'call_question',
			centre_actions_before_call.value as 'center_action_before_call',
			clinical_support_responses.value as 'clinical_support_response'			
		FROM satlog.logs logs
		left join satlog.users as users on logs.created_by = users.id
		left join satlog.categories as categories on logs.category_id = categories.id
		left join satlog.call_questions as call_questions on logs.call_question_id = call_questions.id
		left join satlog.centre_actions_before_call as centre_actions_before_call on logs.centre_action_before_call_id = centre_actions_before_call.id
		left join satlog.clinical_support_responses as clinical_support_responses on logs.clinical_support_response_id = clinical_support_responses.id		
		where logs.id >=130 and logs.id <=150
		;		
 
    
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET log_finished = 1;

	call cleanTicketBundle();
    OPEN log_cursor;
 
    get_log: LOOP

		SET content = '';
 
        
		FETCH log_cursor INTO log_id, created_by, created_at,
			resolved_int, resolved_at, resolved_by, category,
			called_at, call_question, center_action_before_call,
			clinical_support_response;
 
        IF log_finished = 1 THEN 
            LEAVE get_log;
        END IF;

		IF resolved_int = 1 THEN
			SET status = 'resolved';
		END IF;

		IF resolved_at is null THEN
			SET resolved_at = created_at;
		END IF;
		

		CALL getClinicalOwnerId(created_by);

		
		IF called_at is not null THEN
			SET content = concat("<u><strong>Called At:</strong></u> ", CAST(called_at AS CHAR), "<br />\n<br />\n");
			
		END IF;	
		
		
		IF call_question is not null THEN
			SET content = concat(content, "<u><strong>Call Question:</strong></u><br />\n", CAST(call_question AS CHAR), "<br />\n<br />\n");
			
		END IF;
	
		
		
		IF center_action_before_call is not null THEN
			SET content = concat(content, "<u><strong>Centre Action:</strong></u><br />\n", CAST(center_action_before_call AS CHAR) , "<br />\n<br />\n");
		END IF;

		
		IF clinical_support_response is not null THEN
			SET content = concat(content, "<u><strong>Clinical Support Response:</strong></u><br />\n", CAST(clinical_support_response AS CHAR) , "<br />\n<br />\n<br />\n<br />\n<br />\n");
		END IF;	
		
 
        
		call createTicketAndDependencies(
			log_id,
			created_by, 
			category, 
			content, 
			status, 
			created_at, 
			resolved_at 
		);
 
    END LOOP get_log;
 
    CLOSE log_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `copySatLogCustomFields` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `copySatLogCustomFields`()
BEGIN

	DECLARE log_finished INTEGER DEFAULT 0;
	
	DECLARE log_id int(11) DEFAULT 0;
	DECLARE created_by int(11) DEFAULT 0;
	DECLARE created_at datetime DEFAULT '1970-01-01 00:00:00';
	DECLARE resolved_int smallint(6) DEFAULT 0;
	DECLARE status varchar(64) DEFAULT 'open';
	DECLARE resolved_at datetime DEFAULT '1970-01-01 00:00:00';
	DECLARE resolved_by int(11) DEFAULT 0;
	DECLARE category varchar(50) DEFAULT '';
	DECLARE called_at datetime DEFAULT '1970-01-01 00:00:00';
	DECLARE call_question longtext DEFAULT NULL;
	DECLARE center_action_before_call longtext DEFAULT NULL;
	DECLARE clinical_support_response longtext DEFAULT NULL;

	DECLARE content longblob DEFAULT '';

	
	
 
    
    DEClARE log_cursor CURSOR FOR 
        SELECT
			logs.id as 'log_id',
			logs.created_by,
			logs.created_at,
			logs.resolved,
			logs.resolved_at,
			logs.resolved_by,
			categories.name as 'category',
			logs.called_at,
			call_questions.value as 'call_question',
			centre_actions_before_call.value as 'center_action_before_call',
			clinical_support_responses.value as 'clinical_support_response'			
		FROM satlog.logs logs
		left join satlog.users as users on logs.created_by = users.id
		left join satlog.categories as categories on logs.category_id = categories.id
		left join satlog.call_questions as call_questions on logs.call_question_id = call_questions.id
		left join satlog.centre_actions_before_call as centre_actions_before_call on logs.centre_action_before_call_id = centre_actions_before_call.id
		left join satlog.clinical_support_responses as clinical_support_responses on logs.clinical_support_response_id = clinical_support_responses.id
		-- where logs.id >=0 and logs.id <=10
		;		
 
    
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET log_finished = 1;

	call cleanTicketBundle();
    OPEN log_cursor;
 
    get_log: LOOP

		SET content = '';
 
        
		FETCH log_cursor INTO log_id, created_by, created_at,
			resolved_int, resolved_at, resolved_by, category,
			called_at, call_question, center_action_before_call,
			clinical_support_response;
 
        IF log_finished = 1 THEN 
            LEAVE get_log;
        END IF;

		IF resolved_int = 1 THEN
			SET status = 'resolved';
		END IF;

		IF resolved_at is null THEN
			SET resolved_at = created_at;
		END IF;
		

		CALL getClinicalOwnerId(created_by);

		
		IF called_at is not null THEN
			SET content = concat("<u><strong>Called At:</strong></u> ", CAST(called_at AS CHAR), "<br />\n<br />\n");
			
		END IF;	
		
		
		IF call_question is not null THEN
			SET content = concat(content, "<u><strong>Call Question:</strong></u><br />\n", CAST(call_question AS CHAR), "<br />\n<br />\n");
			
		END IF;
	
		
		
		IF center_action_before_call is not null THEN
			SET content = concat(content, "<u><strong>Centre Action:</strong></u><br />\n", CAST(center_action_before_call AS CHAR) , "<br />\n<br />\n");
		END IF;

		
		IF clinical_support_response is not null THEN
			SET content = concat(content, "<u><strong>Clinical Support Response:</strong></u><br />\n", CAST(clinical_support_response AS CHAR) , "<br />\n<br />\n<br />\n<br />\n<br />\n");
		END IF;	
		
 
        
		call createTicketAndDependencies(
			log_id,
			created_by, 
			category, 
			content, 
			status, 
			created_at, 
			resolved_at 
		);
 
    END LOOP get_log;
 
    CLOSE log_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CopySatLogUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CopySatLogUsers`()
BEGIN
	SELECT * FROM satlog.Users;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createCustomFieldValuesForMedication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createCustomFieldValuesForMedication`(
	
		
	
	IN ticketId INT(11),
	IN createdBy INT(11),
	IN createdAt DATETIME, 
	IN updatedBy INT(11), 
	IN updatedAt DATETIME,
	
	IN medication VARCHAR(255)
)
BEGIN
	

        

	

	
	IF medication is not null THEN
		call createSingleCustomField(17, ticketId, medication, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createCustomFieldValuesForProgramPhase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createCustomFieldValuesForProgramPhase`(
	
		
	
	IN ticketId INT(11),
	IN createdBy INT(11),
	IN createdAt DATETIME, 
	IN updatedBy INT(11), 
	IN updatedAt DATETIME,
	
	IN programPhase VARCHAR(255)
)
BEGIN
	

        

	

	
	IF programPhase is not null THEN
		call createSingleCustomField(22, ticketId, programPhase, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createCustomFieldValuesWithoutMedication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createCustomFieldValuesWithoutMedication`(
		
	
	IN ticketId INT(11),
	IN createdBy INT(11),
	IN createdAt DATETIME, 
	IN updatedBy INT(11), 
	IN updatedAt DATETIME,

	IN category VARCHAR(255), 
	IN centreID VARCHAR(255), 
	IN centrePhone VARCHAR(255), 
	IN centreEmail VARCHAR(255),
	IN centreAddress VARCHAR(255), 
	IN callerName VARCHAR(255), 
	IN clientFirstName VARCHAR(255),
	IN clientLastName VARCHAR(255), 
	IN gender VARCHAR(255), 
	IN age VARCHAR(255),
	IN startWeight VARCHAR(255), 
	IN currentWeight VARCHAR(255),
	IN goalWeight VARCHAR(255), 
	IN qlpProgram VARCHAR(255), 
	IN product VARCHAR(255), 
	IN dosage VARCHAR(255),
	IN medicalHistory VARCHAR(255), 
	IN resolution LONGBLOB
)
BEGIN
	

	

        

	

	
	IF category is not null THEN
		call createSingleCustomField(1, ticketId, category, createdBy, createdAt, updatedBy, updatedAt);
	END IF;	

	
	IF centreID is not null THEN
		call createSingleCustomField(2, ticketId, centreID, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF centrePhone is not null THEN
		call createSingleCustomField(3, ticketId, centrePhone, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF centreEmail is not null THEN
		call createSingleCustomField(4, ticketId, centreEmail, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF centreAddress is not null THEN
		call createSingleCustomField(5, ticketId, centreAddress, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF callerName is not null THEN
		call createSingleCustomField(6, ticketId, callerName, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF clientFirstName is not null THEN
		call createSingleCustomField(7, ticketId, clientFirstName, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF clientLastName is not null THEN
		call createSingleCustomField(8, ticketId, clientLastName, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF gender is not null THEN
		call createSingleCustomField(9, ticketId, gender, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF age is not null THEN
		call createSingleCustomField(10, ticketId, age, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF startWeight is not null THEN
		call createSingleCustomField(11, ticketId, startWeight, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF currentWeight is not null THEN
		call createSingleCustomField(12, ticketId, currentWeight, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF goalWeight is not null THEN
		call createSingleCustomField(13, ticketId, goalWeight, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF qlpProgram is not null THEN
		call createSingleCustomField(14, ticketId, qlpProgram, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF product is not null THEN
		call createSingleCustomField(15, ticketId, product, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	IF dosage is not null THEN
		call createSingleCustomField(16, ticketId, dosage, createdBy, createdAt, updatedBy, updatedAt);
	END IF;

	
	

	
	IF medicalHistory is not null THEN
		call createSingleCustomField(19, ticketId, medicalHistory, createdBy, createdAt, updatedBy, updatedAt);
	END IF;
	
	
	IF resolution is not null THEN
		call createSpecialSingleCustomField(20, ticketId, resolution, createdBy, createdAt, updatedBy, updatedAt);
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createMedicationsList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createMedicationsList`()
BEGIN

delete from CustomFieldValues where CustomField = 17;
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, '5-ASA', 0, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Abacavir', 1, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Abatacept', 2, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Abciximab', 3, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Abilify', 4, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Abraxane', 5, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Abreva', 6, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'AC&C', 7, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Acarbose', 8, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Accolate', 9, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Accupril', 10, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Accuretic', 11, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Accutane', 12, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Acebutolol', 13, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aceon', 14, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Acetaminophen', 15, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Acetazolamide', 16, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Acetylsalicylic acid', 17, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'AcipHex', 18, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Acitretin', 19, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aclasta', 20, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aclavulanate', 21, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Actifed', 22, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Activella', 23, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Actonel', 24, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Actonel Plus Calcium', 25, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'ACTOplus met', 26, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Actos', 27, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Acular', 28, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Acyclovir', 29, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aczone', 30, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Adalat XL', 31, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Adalimumab', 32, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Adapalene', 33, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Adderall XR', 34, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Adefovir', 35, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Advair', 36, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Advicor', 37, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Advil', 38, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Advil Cold and Sinus', 39, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aerius', 40, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'AeroBid', 41, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Afrin', 42, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aggrenox', 43, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Agrylin', 44, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Airomir', 45, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alavert', 46, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alaway', 47, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Albuterol', 48, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aldactazide', 49, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aldactone', 50, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aldara', 51, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aldomet', 52, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aldoril', 53, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alendronate', 54, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alertec', 55, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alesse', 56, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aleve', 57, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alfacalcidol', 58, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alfenta', 59, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alfentanil', 60, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alfuzosin', 61, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alimta', 62, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alkeran', 63, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Allegra', 64, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Allegra-D', 65, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Allerdryl', 66, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Allernix', 67, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alli', 68, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Allopurinol', 69, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Almotriptan', 70, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alocril', 71, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aloprim', 72, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alosetron', 73, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aloxi', 74, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alphagan', 75, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alprazol', 76, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alprazolam', 77, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alprostadil', 78, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Altace', 79, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alupent', 80, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Alvesco', 81, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amantadine', 82, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amaryl', 83, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amatine', 84, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ambien', 85, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amcinonide', 86, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amerge', 87, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amevive', 88, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amicar', 89, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amiloride', 90, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amilzide', 91, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aminophylline', 92, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amiodarone', 93, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amitriptyline', 94, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amlodipine', 95, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amox-Clav', 96, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amoxicillin', 97, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Amoxicillin-Clavulanic', 98, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ampicillin', 99, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anacin', 100, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anafranil', 101, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anandron', 102, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anaprox', 103, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anastrozole', 104, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anbesol', 105, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Andriol', 106, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Androcur', 107, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Androderm', 108, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'AndroGel', 109, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anexsia', 110, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Angeliq', 111, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anoquan', 112, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ansaid', 113, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Antara', 114, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Antivert', 115, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anturane', 116, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anugesic', 117, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anusol', 118, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Anzemet', 119, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Apidra', 120, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Apixaban', 121, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Apo-hydro', 122, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Apo-K', 123, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Apokyn', 124, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Apresoline', 125, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Apri', 126, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aptivus', 127, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aranesp', 128, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Arava', 129, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aredia', 130, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Arformeterol', 131, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aricept', 132, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Arimidex', 133, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aripiprazole', 134, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aromasin', 135, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Artane', 136, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Arthrotec', 137, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'ASA', 138, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Asacol', 139, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Asaphen', 140, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Asmanex', 141, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aspirin', 142, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atacand', 143, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atacand Plus', 144, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atarax', 145, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atasol', 146, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atenidone', 147, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atenol', 148, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atenolol', 149, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ativan', 150, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atomoxetine', 151, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atorvastatin', 152, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atralin', 153, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atripla', 154, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Atrovent', 155, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Auralgan', 156, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aurothiomalate', 157, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Autopen 24', 158, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Avalide', 159, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Avandamet', 160, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Avandaryl', 161, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Avandia', 162, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Avapro', 163, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Avastin', 164, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Avelox', 165, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aventyl', 166, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Aviane', 167, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Avodart', 168, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Avonex', 169, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Axert', 170, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Axid', 171, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'AzaSite', 172, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Azatadine', 173, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Azathioprine', 174, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Azilect', 175, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Azithromycin', 176, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Azopt', 177, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Azor', 178, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bacid', 179, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Baciguent', 180, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bacitracin', 181, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Baclofen', 182, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bactrim', 183, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bactroban', 184, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Baraclude', 185, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Becloforte', 186, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Beclomethasone', 187, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bellergal', 188, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Benadryl', 189, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Benazepril', 190, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Benicar', 191, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Benoxyl', 192, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bentylol', 193, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Benzac', 194, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'BenzaClin', 195, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Benzamycin', 196, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Benztropine', 197, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Berotec', 198, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Betadine', 199, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Betagan', 200, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Betahistine', 201, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Betaloc', 202, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Betamethasone', 203, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Betaseron', 204, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Betaxolol', 205, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bethanechol', 206, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Betnesol', 207, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Betoptic S', 208, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bevacizumab', 209, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bextra', 210, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bezafibrate', 211, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bezalip', 212, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Biaxin', 213, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bicalutamide', 214, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'BiDil', 215, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bimatoprost', 216, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Biphentin', 217, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bisacodyl', 218, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bisoprolol', 219, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bonamine', 220, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bonefos', 221, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Boniva', 222, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bosentan', 223, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Botox', 224, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Brevibloc', 225, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Brevicon', 226, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bricanyl', 227, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Brimonidine', 228, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Brinzolamide', 229, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bromazepam', 230, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bromocriptine', 231, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Brovana', 232, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Buckleys Cough Cold and Flu', 233, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Budesonide', 234, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bufferin', 235, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bumetanide', 236, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Bupropion', 237, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Burinex', 238, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Buscopan', 239, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Buserelin', 240, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'BuSpar', 241, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Buspirone', 242, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Butorphanol', 243, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Butran', 244, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Byetta', 245, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'C.E.S.', 246, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cabergoline', 247, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Caduet', 248, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Caelyx', 249, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cafergot', 250, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Caffeine', 251, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Caladryl', 252, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Calcijex', 253, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Calcipotriene', 254, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Calcipotriol', 255, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Calcitonin', 256, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Calcitriol', 257, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'CaloMist', 258, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Caltine', 259, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Candesartan', 260, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Canestan', 261, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Capex', 262, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Capoten', 263, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Capsaicin', 264, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Captique', 265, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Captopril', 266, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Carbamazepine', 267, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Carbolith', 268, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cardizem', 269, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cardura', 270, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Carvedilol', 271, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cascara', 272, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Casodex', 273, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Catapres', 274, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Caverject', 275, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ceclor', 276, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cefaclor', 277, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cefixime', 278, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cefprozil', 279, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ceftin', 280, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cefuroxime', 281, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cefzil', 282, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Celebrex', 283, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Celecoxib', 284, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Celexa', 285, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'CellCept', 286, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cephalexin', 287, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cerebyx', 288, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cesamet', 289, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cetirizine', 290, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Champix', 291, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chantix', 292, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chlor-Trimeton', 293, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chlor-Tripolon', 294, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chloral hydrate', 295, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chlorambucil', 296, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chlorax', 297, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chlordiazepoxide', 298, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chloroquine', 299, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chlorpromazine', 300, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chlorpropamide', 301, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chlorthalidone', 302, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Choledyl', 303, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cholestyramine', 304, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Chronovera', 305, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cialis', 306, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cicatrin', 307, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ciclesonide', 308, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ciclopirox', 309, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cilazapril', 310, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ciloxan', 311, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cimetidine', 312, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cimzia', 313, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cipralex', 314, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cipro', 315, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ciprodex', 316, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ciproflox', 317, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ciprofloxacin', 318, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Citalopram', 319, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clarinex', 320, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clarithromycin', 321, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Claritin', 322, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clarus', 323, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clavulin', 324, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Climacteron', 325, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Climara', 326, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clindamycin', 327, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clindasol', 328, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clindesse', 329, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clindets', 330, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clindoxyl', 331, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clobazam', 332, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clobetasone', 333, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clobex', 334, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clodronate', 335, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clomid', 336, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clomiphene', 337, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clomipramine', 338, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clonazepam', 339, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clonidine', 340, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clopidogrel', 341, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clorazepate', 342, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clorthalidone', 343, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clotrimazole', 344, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cloxacillin', 345, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clozapine', 346, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Clozaril', 347, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'CoActifed', 348, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Codeine', 349, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Codeine Contin', 350, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cogentin', 351, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Colace', 352, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Colchicine', 353, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Colestid', 354, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Colestipol', 355, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Colyte', 356, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Combigan', 357, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Combivent', 358, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Combivir', 359, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Combunox', 360, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Comtan', 361, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Concerta', 362, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Copaxone', 363, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cordarone', 364, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Coreg', 365, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Corgard', 366, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Coricidin', 367, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cortef', 368, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cortisone', 369, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cortisporin', 370, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cosopt', 371, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cotazym', 372, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cotrimox', 373, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Coumadin', 374, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Coversyl', 375, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Coversyl Plus', 376, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cozaar', 377, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Creon', 378, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Crestor', 379, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Crixivan', 380, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cromolyn', 381, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cubicin', 382, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cyclen', 383, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cyclobenzaprine', 384, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cyclocort', 385, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cyclomen', 386, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cyclophosphamide', 387, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cyclosporine', 388, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cyestra-35', 389, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cyklokapron', 390, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cymbalta', 391, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cyproterone', 392, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cytomel', 393, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Cytoxan', 394, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dabigatran', 395, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dalacin', 396, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dalmane', 397, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dalteparin', 398, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Danazol', 399, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dantrium', 400, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dantrolene', 401, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dapsone', 402, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Darifenacin', 403, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Darunavir', 404, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Darvocet', 405, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Darvon-N', 406, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Daypro', 407, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'DayQuil', 408, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'DDAVP', 409, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Decadron', 410, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Deferasirox', 411, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Deferoxamine', 412, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Delatestryl', 413, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Delsym', 414, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Demerol', 415, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Demulen', 416, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Denavir', 417, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Depakene', 418, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Depakote', 419, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Depo-Medrol', 420, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Depo-Provera', 421, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'DepoDur', 422, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Deponit', 423, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Deprenyl', 424, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dermatix', 425, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dermatop', 426, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Desferasirox', 427, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Desiccated thyroid', 428, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Desipramine', 429, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Desloratadine', 430, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Desmopressin', 431, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Desocort', 432, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Desonide', 433, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Desyrel', 434, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Detemir', 435, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Detrol', 436, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dexamethasone', 437, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dexedrine', 438, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dexilant', 439, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dextroamphetamine', 440, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dextromethorphan', 441, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'DHEA', 442, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diabeta', 443, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diamicron', 444, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diamox', 445, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diane-35', 446, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diastat', 447, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diazepam', 448, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dicetel', 449, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diclectin', 450, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diclofenac', 451, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dicyclomine', 452, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Didrocal', 453, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Didronel', 454, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diethylpropion', 455, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diethylproprion', 456, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Difenac', 457, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Differin', 458, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diflucan', 459, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diflunisal', 460, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Digoxin', 461, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dihydroergotamine', 462, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dilantin', 463, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dilaudid', 464, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diltiazem', 465, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dimenhydrinate', 466, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diovan', 467, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dipentum', 468, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diphenhydramine', 469, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diprolene', 470, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diprosalic', 471, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Diprosone', 472, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dipyridamole', 473, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Disopyramide', 474, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Disulfiram', 475, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ditropan', 476, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Divalproex', 477, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Divigel', 478, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dixarit', 479, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Docetaxel', 480, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Docosanol', 481, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Docusate', 482, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dolasteron', 483, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Domperidone', 484, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Donepezil', 485, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dorzolamide', 486, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dostinex', 487, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dovobet', 488, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dovonex', 489, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Doxazosin', 490, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Doxepin', 491, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Doxorubicin', 492, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Doxy', 493, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Doxycycline', 494, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Doxylamine', 495, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dramamine', 496, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dristran', 497, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Drixoral', 498, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dukoral', 499, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dulcolax', 500, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Duloxetine', 501, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Duragesic', 502, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Duralith', 503, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Duricef', 504, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dutasteride', 505, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Duvoid', 506, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Dyazide', 507, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ebixa', 508, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Econazole', 509, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ecostatin', 510, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ectosone', 511, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Edecrin', 512, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Efavirenz', 513, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Effexor', 514, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Efudex', 515, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Elavil', 516, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Elestat', 517, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Elestrin', 518, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Elidel', 519, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Eligard', 520, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Elmiron', 521, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Elocom', 522, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Eltor', 523, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Eltroxin', 524, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Emend', 525, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'EMLA', 526, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Empracet', 527, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Emtec', 528, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Enablex', 529, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Enalapril', 530, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Enbrel', 531, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Endocet', 532, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Endodan', 533, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Enjuvia', 534, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Enoxaparin', 535, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Entacapone', 536, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Entecavir', 537, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Entex LA', 538, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Entocort', 539, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Entrophen', 540, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Epi-Pen', 541, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Epival', 542, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Epoetin Alfa', 543, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Eprex', 544, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Eprosartan', 545, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Equetro', 546, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ergotamine', 547, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ertaczo', 548, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Eryc', 549, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Erythromycin', 550, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Escitalopram', 551, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Esmolol', 552, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Esomeprazole', 553, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estalis', 554, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estrace', 555, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estracomb', 556, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estraderm', 557, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estradiol', 558, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estradot', 559, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estrasorb', 560, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estring', 561, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estrogel', 562, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estrogen', 563, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Estropipate', 564, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ethacrynic acid', 565, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ethosuximide', 566, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Etidrocal', 567, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Etidronate', 568, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Etodolac', 569, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Euflex', 570, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Eumovate', 571, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'EvaMist', 572, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Evista', 573, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Evoclin', 574, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Evra', 575, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Excedrin', 576, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Exelon', 577, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Exemestane', 578, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Exenatide', 579, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Exforge', 580, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Exjade', 581, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ezetimibe', 582, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ezetrol', 583, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Factive', 584, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Famciclovir', 585, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Famotidine', 586, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Famvir', 587, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fazaclo', 588, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Feldene', 589, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Feledene', 590, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Felodipine', 591, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Femara', 592, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'femHRT', 593, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Femring', 594, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Femtrace', 595, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Feno-Micro', 596, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Feno-Super', 597, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fenofibrate', 598, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fenoterol', 599, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fentanyl', 600, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fentora', 601, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ferrous sulfate', 602, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fexofenadine', 603, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Finasteride', 604, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fiorinal', 605, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fiorinal-C', 606, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flagyl', 607, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flagystatin', 608, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flamazine', 609, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flavoxate', 610, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flecainide', 611, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flexeril', 612, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flomax', 613, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flonase', 614, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Florinef', 615, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flovent', 616, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluanxol', 617, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluconazole', 618, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fludrocortisone', 619, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flunarizine', 620, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluocinolone', 621, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluocinonide', 622, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluorouracil', 623, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluoxetine', 624, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flupenthixol', 625, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluphenazine', 626, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flurazepam', 627, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flurbiprofen', 628, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flurouracil', 629, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Flutamide', 630, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluticasone', 631, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluvastatin', 632, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluvoxamine', 633, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fluxid', 634, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Focalin XR', 635, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Follistim AQ', 636, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Foradil', 637, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Formoterol', 638, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fortamet', 639, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Forteo', 640, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fortovase', 641, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fosamax', 642, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fosavance', 643, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fosfomycin', 644, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fosinopril', 645, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fosphenytoin', 646, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fosrenol', 647, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fragmin', 648, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Frisium', 649, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Froben', 650, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Frovatriptan', 651, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fucidin', 652, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fucithalmic', 653, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Furosemide', 654, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Fusidic Acid', 655, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gabapentin', 656, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Galantamine', 657, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Garamycin', 658, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Garasone', 659, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gardasil', 660, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gastrolyte', 661, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gatifloxacin', 662, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gaviscon', 663, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gefitinib', 664, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gemfibrozil', 665, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gemifloxacin', 666, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gilenya', 667, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Glargine', 668, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gleevec', 669, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gliclazide', 670, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Glimepiride', 671, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Glipizide', 672, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Glucobay', 673, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'GlucoNorm', 674, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Glucophage', 675, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Glucotrol', 676, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Glumetza', 677, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Glyburide', 678, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Glycon', 679, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Golimumab', 680, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gonal F', 681, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Goserelin', 682, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Granisetron', 683, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gravergol', 684, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gravol', 685, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Guanifenesin', 686, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Gynazole', 687, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Halcion', 688, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Haloperidol', 689, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'HCTZ', 690, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Heparin', 691, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hepsera', 692, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Heptovir', 693, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'HP Pac', 694, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'HRT', 695, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Humalog', 696, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Humatrope', 697, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Humira', 698, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Humulin', 699, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hycamtin', 700, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hycodan', 701, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hycomine', 702, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydralazine', 703, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydrazide', 704, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydrea', 705, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydrocet', 706, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydrochlorothiazide', 707, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydrocodone', 708, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydrocortisone', 709, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydromorph Contin', 710, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydromorphone', 711, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'HydroVal', 712, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydroxychloroquine', 713, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydroxyurea', 714, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hydroxyzine', 715, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hyoscine', 716, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hypurin', 717, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hytrin', 718, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Hyzaar', 719, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ibandronate', 720, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ibuprofen', 721, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Icaps', 722, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Idamycin', 723, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Imdur', 724, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Imipramine', 725, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Imiquimod', 726, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Imitrex', 727, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Imodium', 728, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Imovane', 729, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Imuran', 730, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Indapamide', 731, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Inderal', 732, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Indinavir', 733, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Indocid', 734, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Indomethacin', 735, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Infliximab', 736, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Inhibace', 737, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Innohep', 738, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Insulin', 739, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Intal', 740, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Intercept', 741, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Intercept CS', 742, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Interferon beta-1a', 743, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Interferon beta-1b', 744, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Invega', 745, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Invirase', 746, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ionamin', 747, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ipratropium', 748, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Iprivask', 749, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Iquix', 750, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Irbesartan', 751, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Iressa', 752, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'ISDN', 753, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Isoniazid', 754, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Isoptin SR', 755, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Isosorbide', 756, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Isotretinoin', 757, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Itraconazole', 758, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Jantoven', 759, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Janumet', 760, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Januvia', 761, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'K-Dur', 762, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Kaletra', 763, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Kapidex', 764, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Kayexalate', 765, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Keflex', 766, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Kemadrin', 767, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Kenalog', 768, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Kepivance', 769, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Keppra', 770, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ketek', 771, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ketoconazole', 772, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ketoderm', 773, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ketoprofen', 774, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ketorolac', 775, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ketotifen', 776, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Kivexa', 777, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Kytril', 778, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Labetalol', 779, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lactaid', 780, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lactase', 781, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lactulose', 782, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lamictal', 783, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lamisil', 784, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lamivudine', 785, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lamotrigine', 786, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lanoxin', 787, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lansoprazole', 788, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lantus', 789, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lariam', 790, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lasix', 791, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Latanoprost', 792, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'LDN', 793, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lectopam', 794, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Leflunomide', 795, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lenoltec', 796, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lescol', 797, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Letrozole', 798, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Leukeran', 799, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Leuprolide', 800, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Levaquin', 801, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Levemir', 802, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Levetiracetam', 803, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Levitra', 804, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Levobunolol', 805, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Levocabastine', 806, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Levodopa', 807, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Levodopa/Carbidopa', 808, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Levofloxacin', 809, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Levothyroxine', 810, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lexapro', 811, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lexin', 812, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lexiva', 813, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lialda', 814, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Liberator', 815, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Librax', 816, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Librium', 817, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Licorice Root (Glycyrrhiza glabra)', 818, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Linessa', 819, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Liothyronine Sodium', 820, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lipidil', 821, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lipitor', 822, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lisinopril', 823, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lithane', 824, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lithium', 825, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Livostin', 826, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Locacorten', 827, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lodine', 828, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Loestrin', 829, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lomotil', 830, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Loniten', 831, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Loperamide', 832, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lopid', 833, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lopressor', 834, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Loprox', 835, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Loratadine', 836, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lorazepam', 837, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Losartan', 838, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Losec', 839, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lotensin', 840, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lotriderm', 841, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lotronex', 842, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lovastatin', 843, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lovenox', 844, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Loxapine', 845, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lozide', 846, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lucentis', 847, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ludiomil', 848, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lumigan', 849, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lumiracoxib', 850, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lunesta', 851, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lupron', 852, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lutera', 853, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Luveris', 854, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Luvox', 855, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lyderm', 856, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Lyrica', 857, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'M-Eslon', 858, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'M.O.S.', 859, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mabcampath', 860, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'MacroBID', 861, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Macrodantin', 862, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Macugen', 863, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Malarone', 864, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mandelamine', 865, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Manerix', 866, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Maprotiline', 867, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Marcaine', 868, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Marijuana Pill', 869, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Marijuana Inhalation', 870, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Marvelon', 871, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mavik', 872, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Maxalt', 873, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Maxeran', 874, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Maxide', 875, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mebendazole', 876, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Meclizine', 877, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Medrol', 878, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Medroxy', 879, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Medroxyprogesterone', 880, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mefenamic acid', 881, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mefloquine', 882, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Megace', 883, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Megestrol Acetate', 884, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Meloxicam', 885, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Melphalan', 886, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Menactra', 887, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Menopur', 888, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Menostar', 889, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Meperidine', 890, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Meridia', 891, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mersyndol', 892, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mesalamine', 893, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mestinon', 894, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Metamucil', 895, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Metformin', 896, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Methacin', 897, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Methadone', 898, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Methimazole', 899, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Methotrexate', 900, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Methotrimeprazine', 901, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Methyldopa', 902, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Methylphenidate', 903, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Methylprednisolone', 904, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Methysergide', 905, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Metoclopramide', 906, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Metolazone', 907, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Metoprolol', 908, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'MetroCream', 909, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'MetroGel', 910, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'MetroLotion', 911, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Metronidazole', 912, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mevacor', 913, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mexiletine', 914, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mezavant', 915, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Miacalcin NS', 916, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Micafungin', 917, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Micardis', 918, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Micardis Plus', 919, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Micatin', 920, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Miconazole', 921, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Micro-K', 922, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Micronase', 923, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Micronor', 924, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Midamor', 925, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Midodrine', 926, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Migranal', 927, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Milk of Magnesia', 928, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Min-Ovral', 929, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'MinEstrin', 930, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Minirin', 931, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Minitran', 932, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Minocin', 933, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Minocycline', 934, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Minoxidil', 935, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mirapex', 936, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mirena', 937, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mirtazapine', 938, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Misoprostol', 939, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mobicox', 940, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Moclobemide', 941, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Modafinil', 942, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Modecate', 943, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Modulon', 944, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Moduret', 945, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Moexipril', 946, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mogadon', 947, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mometasone', 948, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Monistat', 949, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Monitan', 950, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Monocor', 951, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Monopril', 952, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Montelukast', 953, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Monurol', 954, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Morphine', 955, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Motilium', 956, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Motrin', 957, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Moxifloxacin', 958, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'MS Contin', 959, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'MS-IR', 960, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Multaq', 961, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mupirocin', 962, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'MUSE', 963, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mycamine', 964, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mycophenolate', 965, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mycostatin', 966, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Mylanta', 967, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nabilone', 968, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nabumetone', 969, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nadolol', 970, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nalbuphine', 971, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nalcrom', 972, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Naltrexone', 973, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Namenda', 974, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Naphazoline', 975, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Naprelan', 976, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Naprosyn', 977, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Naproxen', 978, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Naratriptan', 979, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nardil', 980, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nasaleze', 981, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nasocort AQ', 982, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nasonex', 983, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nateglinide', 984, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nedocromil', 985, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Neo-Citran', 986, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Neo-Medrol', 987, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Neoprofen', 988, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Neoral', 989, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Neosporin', 990, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Neupro', 991, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Neurontin', 992, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nevanac', 993, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nexavar', 994, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nexium', 995, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Niacin', 996, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nicoderm', 997, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nicorette', 998, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nicotine', 999, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nifedipine', 1000, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nilstat', 1001, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nilutamide', 1002, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Niravam', 1003, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nitrazepam', 1004, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nitro-Dur', 1005, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nitrofurantoin', 1006, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nitroglycerin', 1007, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nitrolingual', 1008, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nitromist', 1009, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nizatidine', 1010, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nizoral', 1011, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Norflex', 1012, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Norfloxacin', 1013, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Noritate', 1014, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Norpramin', 1015, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nortriptyline', 1016, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Norvasc', 1017, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Norvir', 1018, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Novahistex DH', 1019, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Novahistine DH', 1020, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Novamoxin', 1021, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Novasen', 1022, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Novolin', 1023, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'NovoMix', 1024, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'NovoRapid', 1025, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nozinan', 1026, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nubain', 1027, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nuflexxa', 1028, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nuva-Ring', 1029, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'NyQuil', 1030, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nystatin', 1031, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Nytol', 1032, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ocuflox', 1033, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ofloxacin', 1034, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ogen', 1035, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Olanzapine', 1036, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Olmetec', 1037, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Olopatadine', 1038, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Olux-E', 1039, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Omacor', 1040, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Omeprazole', 1041, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Omnaris', 1042, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ondansetron', 1043, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'One-Alpha', 1044, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Onglyza', 1045, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Opticrom', 1046, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Optimine', 1047, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Orap', 1048, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Orciprenaline', 1049, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Orencia', 1050, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Orlistat', 1051, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Orphenadrine', 1052, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ortho 0.5/35', 1053, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ortho 1/35', 1054, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ortho 7/7/7', 1055, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ortho-Cept', 1056, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ortho-Evra', 1057, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ortho-Novum 1/50', 1058, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Orudis', 1059, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Os-Cal', 1060, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ostac', 1061, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ostoforte', 1062, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ovcon 35', 1063, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ovral', 1064, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxaprozin', 1065, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxazepam', 1066, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxcarbazepine', 1067, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxeze', 1068, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxtriphylline', 1069, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxy-IR', 1070, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxybutynin', 1071, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxycocet', 1072, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxycodan', 1073, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxycodone', 1074, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'OxyContin', 1075, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Oxytrol', 1076, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Paclitaxel', 1077, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Palafer', 1078, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Palifermin', 1079, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Paliperidone', 1080, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Palladone', 1081, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pamidronate', 1082, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pancrealipase', 1083, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pancrease', 1084, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pancrelipase', 1085, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Panectyl', 1086, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pantoloc', 1087, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pantoprazole', 1088, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Parcopa', 1089, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pariet', 1090, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Parlodel', 1091, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Parnate', 1092, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Paroxetine', 1093, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Patanol', 1094, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Patoprazole', 1095, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Paxil', 1096, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pegaptanib', 1097, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pegasys', 1098, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pegintron', 1099, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Penciclovir', 1100, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Penicillin', 1101, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Penlac', 1102, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pennsaid', 1103, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pentasa', 1104, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pentazocine', 1105, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pentoxifylline', 1106, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pepcid', 1107, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pepto-Bismol', 1108, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Percocet', 1109, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Percodan', 1110, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Perforomist', 1111, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pergolide', 1112, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Peridex', 1113, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Perindopril', 1114, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Periostat', 1115, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Permax', 1116, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Perphenazine', 1117, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Persantine', 1118, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pethidine', 1119, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Phazyme', 1120, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Phenazo', 1121, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Phenazopyridine', 1122, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Phenelzine', 1123, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Phenergan', 1124, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Phenobarbital', 1125, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Phentermine', 1126, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Phenytoin', 1127, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Phoslax', 1128, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pilocarpine', 1129, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pimecrolimus', 1130, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pimozide', 1131, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pinaverium', 1132, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pindolol', 1133, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pioglitazone', 1134, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Piroxicam', 1135, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pivampicillin', 1136, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pizotifen', 1137, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Plaquenil', 1138, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Plavix', 1139, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Plendil', 1140, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Polycarbophil', 1141, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Polycitra-K', 1142, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Polygynax', 1143, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Polysporin', 1144, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pondocillin', 1145, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ponstan', 1146, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ponstel', 1147, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Portia', 1148, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Potassium', 1149, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pramipexole', 1150, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prandase', 1151, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pranol', 1152, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pravachol', 1153, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'PravASA', 1154, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pravastatin', 1155, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prazosin', 1156, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prednicarbate', 1157, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prednisolone', 1158, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prednisone', 1159, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pregabalin', 1160, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Premarin', 1161, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Premplus', 1162, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prempro', 1163, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Preterax', 1164, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prevacid', 1165, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prexige', 1166, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prezista', 1167, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prialt', 1168, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prilosec', 1169, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Primidone', 1170, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prinivil', 1171, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prinzide', 1172, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pristiq', 1173, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prochlorperazine', 1174, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Procyclidine', 1175, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Progesterone', 1176, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prograf', 1177, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prolia', 1178, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prolopa', 1179, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Proloprim', 1180, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prometrium', 1181, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Propafenone', 1182, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Propecia', 1183, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Propoxyphene', 1184, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Propranolol', 1185, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Propylthiouracil', 1186, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Proquin XR', 1187, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Proscar', 1188, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Protonix', 1189, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Protopic', 1190, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Provera', 1191, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Prozac', 1192, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pseudoephedrine', 1193, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pulmicort', 1194, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Purinethol', 1195, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pylera', 1196, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pyridium', 1197, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pyridostigmine', 1198, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Pyridoxine', 1199, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Questran', 1200, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Quetiapine', 1201, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Quinapril', 1202, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Quinidine', 1203, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Quinine Sulfate', 1204, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Qvar', 1205, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rabeprazole', 1206, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ralivia', 1207, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Raloxifene', 1208, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ramipril', 1209, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ranibizumab', 1210, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ranitidine', 1211, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rapamune', 1212, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Raptiva', 1213, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rasagiline', 1214, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rasilez', 1215, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Reactine', 1216, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rebif', 1217, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Relafen', 1218, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Relenza', 1219, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Relpax', 1220, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Remeron', 1221, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Remicade', 1222, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Reminyl', 1223, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Renagel', 1224, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Renedil', 1225, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Renova', 1226, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'ReoPro', 1227, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Repaglinide', 1228, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Replens', 1229, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'ReQuip', 1230, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Restoril', 1231, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Restylane', 1232, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Resultz', 1233, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Retin-A', 1234, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Revatio', 1235, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'ReVia', 1236, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rhinalar', 1237, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rhinocort', 1238, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rhodis', 1239, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rhotral', 1240, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rhovane', 1241, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ribasphere', 1242, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Riboflavin', 1243, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ridaura', 1244, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rifampin', 1245, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rilutek', 1246, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Riluzole', 1247, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Riomet', 1248, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Risedronate', 1249, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Risperdal', 1250, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Risperdone', 1251, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Risperidone', 1252, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ritalin', 1253, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ritonavir', 1254, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rituxan', 1255, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rivaroxaban', 1256, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rivastigmine', 1257, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rivazide', 1258, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rivotril', 1259, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rizatriptan', 1260, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Robax Platinum', 1261, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Robaxacet', 1262, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Robaxin', 1263, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Robaxisal', 1264, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Robitussin', 1265, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rocaltrol', 1266, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rofact', 1267, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rogaine', 1268, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ropinirole', 1269, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rosasol', 1270, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rosiglitazone', 1271, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rosuvastatin', 1272, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rotateq', 1273, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rotigotine', 1274, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rovamycine', 1275, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rozerem', 1276, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Rythmodan', 1277, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sabril', 1278, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Salagen', 1279, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Salazopyrin', 1280, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Salbutamol', 1281, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Salmeterol', 1282, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Salofalk', 1283, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Salvent', 1284, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sanctura', 1285, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sandomigran', 1286, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sandostatin', 1287, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sansert', 1288, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Saquinvair', 1289, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sativex', 1290, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'SATtest', 1291, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Scolopamine', 1292, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Scopolamine', 1293, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Seasonale', 1294, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Seasonique', 1295, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sebivo', 1296, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Seconal', 1297, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sectral', 1298, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Select 1/35', 1299, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Selegiline', 1300, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Selzentry', 1301, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Semide', 1302, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Senna', 1303, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sennoside', 1304, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Senokot', 1305, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Septra', 1306, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Serax', 1307, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Serc', 1308, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Serevent', 1309, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Serophene', 1310, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Seroquel', 1311, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sertraline', 1312, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sevelamer', 1313, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sibelium', 1314, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sibutramine', 1315, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sildenafil', 1316, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Silver Sulfadiazine', 1317, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Simethicone', 1318, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Simponi', 1319, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Simvastatin', 1320, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sinemet', 1321, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sinequan', 1322, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Singulair', 1323, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'sintron', 1324, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sirolimus', 1325, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sitagliptin', 1326, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sitaxsentan', 1327, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Slow K', 1328, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sodium Cromoglycate', 1329, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Soflax', 1330, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sofracort', 1331, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Soframycin', 1332, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Solage', 1333, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Soltamox', 1334, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Solu-Medrol', 1335, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Solugel', 1336, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Soma', 1337, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Somatropin', 1338, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sonata', 1339, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sorafenib', 1340, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Soriatane', 1341, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sotacor', 1342, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sotalol', 1343, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Spiramycin', 1344, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Spiriva', 1345, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'spironolactone', 1346, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Spiroton', 1347, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Spirozine', 1348, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sporanox', 1349, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Stadol', 1350, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Starlix', 1351, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Starnoc', 1352, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Statex', 1353, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Stelazine', 1354, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Stemetil', 1355, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Stieprox', 1356, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Stievamycin', 1357, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Strattera', 1358, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Stresstabs', 1359, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sucralfate', 1360, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sudafed', 1361, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sulcrate', 1362, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sulfapyridine', 1363, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sulfasalazine', 1364, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sulfatrim', 1365, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sulfinpyrazone', 1366, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sulfonamide', 1367, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sulindac', 1368, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sumatriptan', 1369, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sunitinib', 1370, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Supeudol', 1371, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Suprax', 1372, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Suprefact', 1373, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Surgam', 1374, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Surmontil', 1375, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sustiva', 1376, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Sutent', 1377, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Symbicort', 1378, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Symbyax', 1379, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Symlin', 1380, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Symmetrel', 1381, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Synarel', 1382, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Synphasic', 1383, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Synthroid', 1384, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Synvisc', 1385, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tacrolimus', 1386, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tadalafil', 1387, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tagamet', 1388, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Talwin', 1389, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tambocor', 1390, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tamiflu', 1391, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tamofen', 1392, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tamoxifen', 1393, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tamsulosin', 1394, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tapazole', 1395, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tarka', 1396, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Taxol', 1397, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Taxotere', 1398, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tazarotene', 1399, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tazorac', 1400, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tecnal', 1401, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tecta', 1402, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tegaserod', 1403, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tegretol', 1404, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Telbivudine', 1405, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Telithromycin', 1406, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Telmisartan', 1407, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Telzir', 1408, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Temazepam', 1409, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tenoretic', 1410, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tenormin', 1411, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tenuate', 1412, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tequin', 1413, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Terazol', 1414, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Terazosin', 1415, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Terbinafine', 1416, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Terbutaline', 1417, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Terconazole', 1418, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Teriparatide', 1419, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'TEST 4', 1420, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Testosterone', 1421, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tetracycline', 1422, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Teveten', 1423, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Thalitone', 1424, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Thelin', 1425, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Theo-Bronc', 1426, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Theo-Dur', 1427, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Theophylline', 1428, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Thiamine', 1429, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Thioridazine', 1430, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Thyrotabs', 1431, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Thyroxine', 1432, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tiamol', 1433, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tiaprofenic Acid', 1434, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tiazac', 1435, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ticlid', 1436, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ticlopidine', 1437, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tigecycline', 1438, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Timolol', 1439, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Timpotic', 1440, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tinzaparin', 1441, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tiotropium', 1442, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tizanidine', 1443, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tobradex', 1444, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tobramycin', 1445, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tobrex', 1446, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tofranil', 1447, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tolterodine', 1448, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Topamax', 1449, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Topetecan', 1450, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Topiramate', 1451, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Toradol', 1452, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tracleer', 1453, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Traimcinolone', 1454, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Traimterene', 1455, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trajenta', 1456, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tramacet', 1457, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tramadol', 1458, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trandate', 1459, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trandolapril', 1460, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tranxene', 1461, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Travatan', 1462, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Travoprost', 1463, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trazodone', 1464, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trazorel', 1465, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trelstar', 1466, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trental', 1467, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tretinoin', 1468, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tri-Cyclen', 1469, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triaderm', 1470, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triamazide', 1471, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triamcinolone', 1472, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triamterene', 1473, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triazide', 1474, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triazolam', 1475, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'TriCor', 1476, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'TriCyclen Lo', 1477, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tridural', 1478, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triferexx', 1479, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trifluoperazine', 1480, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triglide', 1481, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trihexyphenidyl', 1482, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trileptal', 1483, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trimebutine', 1484, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trimel', 1485, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trimeprazine', 1486, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trimethoprim', 1487, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trimipramine', 1488, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trinalin', 1489, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trinipatch', 1490, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triphasil', 1491, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triptyn', 1492, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Triquilar', 1493, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trizivir', 1494, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trosec', 1495, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trospium', 1496, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Trusopt', 1497, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Truvada', 1498, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tryptan', 1499, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tryptophan', 1500, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tussionex', 1501, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Twinrix', 1502, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tygacil', 1503, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tylenol', 1504, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tylenol #1', 1505, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tylenol #2', 1506, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tylenol #3', 1507, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tylenol #4', 1508, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tylenol Arthritis', 1509, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tylenol Cold', 1510, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tylenol Sinus', 1511, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tylenol with Codeine', 1512, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tysabri', 1513, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Tyzeka', 1514, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Uloric', 1515, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ultrase', 1516, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ultravate', 1517, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Uniphyl', 1518, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Unisom', 1519, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Univasc', 1520, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Urea', 1521, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Uremol', 1522, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Uroxatral', 1523, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'URSO', 1524, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ursodiol', 1525, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vagabatrin', 1526, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vagifem', 1527, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Valacyclovir', 1528, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Valisone', 1529, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Valium', 1530, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Valproic acid', 1531, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Valsartan', 1532, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Valtrex', 1533, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vancocin', 1534, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vancomycin', 1535, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vaniqa', 1536, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vardenafil', 1537, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Varenicline', 1538, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vaseretic', 1539, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vasocon', 1540, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vasotec', 1541, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Velcade', 1542, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Venlafaxine', 1543, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ventolin', 1544, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Veramil', 1545, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Veramyst', 1546, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Verapamil', 1547, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vermox', 1548, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vesicare', 1549, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vfend', 1550, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Viagra', 1551, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vibra-Tabs', 1552, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vibramycin', 1553, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vicodin', 1554, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Victoza', 1555, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vigabatrin', 1556, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vigamox', 1557, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vimovo', 1558, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Visanne', 1559, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Viskazide', 1560, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Visken', 1561, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vitamin A', 1562, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vitmain B6', 1563, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vitmain E', 1564, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Volmax', 1565, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Voltaren', 1566, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Voriconazole', 1567, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Voriconzole', 1568, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vorinconazole', 1569, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vorinostat', 1570, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vytorin', 1571, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Vyvanse', 1572, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Wake-up', 1573, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Warfarin', 1574, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Wellbutrin', 1575, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Wellbutrin XL', 1576, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Westcort', 1577, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Xalacom', 1578, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Xalatan', 1579, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Xanax', 1580, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Xarelto', 1581, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Xatral', 1582, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Xenical', 1583, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Xolair', 1584, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Xylocaine', 1585, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Yasmin', 1586, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Yaz', 1587, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Z-Pak', 1588, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zaditen', 1589, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zaditor', 1590, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zafirlukast', 1591, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zaleplon', 1592, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zanaflex', 1593, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zantac', 1594, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zarontin', 1595, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zaroxolyn', 1596, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zegerid', 1597, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zelapar', 1598, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zeldox', 1599, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zelnorm', 1600, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zemplar', 1601, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zestoretic', 1602, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zestril', 1603, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zetia', 1604, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ziagen', 1605, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Ziprasidone', 1606, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zithromax', 1607, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zmax', 1608, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zocor', 1609, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zofran', 1610, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zoladex', 1611, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zolinza', 1612, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zolmitriptan', 1613, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zoloft', 1614, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zolpidem', 1615, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zomig', 1616, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zopiclone', 1617, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zostrix', 1618, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zovia', 1619, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zovirax', 1620, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zyban', 1621, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zyloprim', 1622, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zymar', 1623, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zyprexa', 1624, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zyrtec', 1625, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');
insert into CustomFieldValues (CustomField, Name, SortOrder, Creator, Created, LastUpdatedBy, LastUpdated) value (17, 'Zytram', 1626, 12, '2014-03-20 22:29:53', 12, '2014-03-20 22:29:53');


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createSingleCustomField` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createSingleCustomField`(
	

	IN customFieldId INT(11), 
	IN ticketId INT(11),
	IN content VARCHAR(255), 
	IN createdBy INT(11), 
	IN createdAt DATETIME, 
	IN updatedBy INT(11), 
	IN updatedAt DATETIME
)
BEGIN
		
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @x2 = 1;

	INSERT INTO ObjectCustomFieldValues VALUES 
	(
		NULL, 
		customFieldId, 
		'RT::Ticket', 
		ticketId, 
		0, 
		content, 
		NULL, 
		NULL, 
		'', 
		createdBy, 
		createdAt, 
		updatedBy, 
		updatedAt, 
		0 
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createSpecialSingleCustomField` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createSpecialSingleCustomField`(
	

	IN customFieldId INT(11), 
	IN ticketId INT(11),
	IN content LONGBLOB, 
	IN createdBy INT(11), 
	IN createdAt DATETIME, 
	IN updatedBy INT(11), 
	IN updatedAt DATETIME
)
BEGIN
		
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @x2 = 1;

	INSERT INTO ObjectCustomFieldValues VALUES 
	(
		NULL, 
		customFieldId, 
		'RT::Ticket', 
		ticketId, 
		0, 
		NULL, 
		content, 		
		NULL, 
		'', 
		createdBy, 
		createdAt, 
		updatedBy, 
		updatedAt, 
		0 
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createTicketAndDependencies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createTicketAndDependencies`(
	IN log_id int(11),
	IN ownerID int(11), 
	IN subject VARCHAR(200),
	IN content LONGBLOB,
	IN status VARCHAR(64),
	IN createdAt datetime, 
	IN resolvedAt datetime
)
BEGIN
	
	
	DECLARE ticketId, transactionId INT DEFAULT 0;
		
	
	SET ticketId = log_id;
	
	

	
	
	SELECT max(id)+1 INTO transactionId FROM Transactions;	
	
	
	call insertTicket(	
		ticketId, 
		ownerId, 
		subject, 
		content, 
		transactionId, 
		status, 
		createdAt, 
		resolvedAt 
	);

	
	
	call insertTransaction(
		ticketId, 
		ownerId, 
		subject, 
		content, 
		transactionId, 
		createdAt 
	);

	
	
	call insertAttachment(
		ticketId, 
		ownerId, 
		subject, 
		content, 
		transactionId, 
		createdAt 
	);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClinicalOwnerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClinicalOwnerId`(INOUT ownerId int(4))
BEGIN
	CASE ownerId
        WHEN  1 THEN
           SET ownerId = 22;
        WHEN 3 THEN
           SET ownerId = 40;
		WHEN 5 THEN
           SET ownerId = 42;
		WHEN 6 THEN
           SET ownerId = 44;
		WHEN 8 THEN
           SET ownerId = 46;
		WHEN 9 THEN
           SET ownerId = 48;
		WHEN 10 THEN
           SET ownerId = 50;
		WHEN 11 THEN
           SET ownerId = 52;
		WHEN 12 THEN
           SET ownerId = 54;
		WHEN 13 THEN
           SET ownerId = 56;
		WHEN 15 THEN
           SET ownerId = 58;
		WHEN 16 THEN
           SET ownerId = 60;
		WHEN 19 THEN
           SET ownerId = 62;
		WHEN 20 THEN
           SET ownerId = 64;		
        ELSE
           SET ownerId = 0;
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMaxTicketId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMaxTicketId`(OUT max int(4))
BEGIN
	SELECT max(id) + 1
    INTO max
    FROM Tickets;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMaxTransactionId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMaxTransactionId`(OUT max int)
BEGIN
	SELECT max(id)+1
    INTO max
    FROM Transactions;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNewUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNewUserId`(IN age int(4), OUT newAge int(4))
BEGIN
	IF age = 1 THEN
		SET newAge = 22;
    ELSEIF age = 3 THEN
        SET newAge = 40;
    ELSEIF age = 5 THEN
        SET newAge = 42;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `handlerdemo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `handlerdemo`()
BEGIN
	

		insert into t 			SELECT		
	
	drugs.name as 'medication'
FROM satlog.logs logs

left join satlog.medication_logs as medication_logs on medication_logs.log_id = logs.id
left join satlog.drugs as drugs on medication_logs.drug_id = drugs.id
-- where logs.id >=0 and logs.id <=50
order by logs.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertAttachment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAttachment`(
	IN ticketId int(11),
	IN ownerId int(11),
	IN subject varchar(200),
	IN content longblob,
	IN transactionId int(11),
	IN createdAt datetime
)
BEGIN
INSERT INTO Attachments VALUES 
(
	NULL, 
	transactionId, 
	0, 
	'rt-4.0.2-28448-1392158039-228.0-0-0@example.com', 
	subject, 
	NULL, 
	'text/html', 
	'none', 
	content, 
	CONCAT('Subject: ',subject,' \nMIME-Version: 1.0\nContent-Type: text/html; charset=\"UTF-8\"\nMessage-ID: <rt-4.0.2-28448-1392158039-228.0-0-0@example.com>\nX-Mailer: MIME-tools 5.505 (Entity 5.505)\nContent-Disposition: inline\nContent-Transfer-Encoding: binary\nX-RT-Original-Encoding: utf-8\nContent-Length: 8\n'), 
	ownerId, 
	createdAt 
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertSampleCustomField` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSampleCustomField`()
BEGIN
	INSERT INTO ObjectCustomFieldValues VALUES 
	(
		1, 
		12, 
		'RT::Ticket', 
		2, 
		0, 
		'Male', 
		NULL, 
		NULL, 
		'', 
		12, 
		'2014-02-05 19:44:08', 
		12, 
		'2014-02-05 19:44:08', 
		0 
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertSampleTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSampleTicket`(IN id int(11))
BEGIN
	INSERT INTO Tickets
VALUES
(
	id, 
	id, 
	1, 
	'ticket', 
	0, 
	0, 
	22, 
	'DB Testing', 
	0, 
	0, 
	0, 
	0, 
	0, 
	'open', 
	0, 
	NULL, 
	'1970-01-01 00:00:00', 
	'2014-02-05 15:18:27', 
	'1970-01-01 00:00:00', 
	'1970-01-01 00:00:00', 
	22, 
	'2014-02-05 15:18:57', 
	22, 
	'2014-02-05 15:17:52', 
	0 
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTicket`(
	IN ticketId int(11),
	IN ownerId int(11),
	IN subject varchar(200),
	IN content longblob,
	IN transactionId int(11),
	IN status varchar(64),	
	IN createdAt datetime,
	IN resolvedAt datetime
)
BEGIN
INSERT INTO Tickets
VALUES
(
	ticketId, 
	ticketId, 
	1, 
	'ticket', 
	0, 
	0, 
	ownerId, 
	subject, 
	0, 
	0, 
	0, 
	0, 
	0, 
	status, 
	0, 
	NULL, 
	createdAt, 
	createdAt, 
	NULL, 
	resolvedAt, 
	ownerId, 
	createdAt, 
	ownerId, 
	createdAt, 
	0 
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTransaction`(
	IN ticketId int(11),
	IN ownerId int(11),
	IN subject varchar(200),
	IN content longblob,
	IN transactionId int(11),
	IN createdAt datetime
)
BEGIN
INSERT INTO Transactions VALUES 
(
	transactionId, 
	'RT::Ticket', 
	ticketId, 
	0, 
	'Create', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	ownerId, 
	createdAt 
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loop_logs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loop_logs`(INOUT log_list varchar(4000))
BEGIN
 
    DECLARE log_finished INTEGER DEFAULT 0;
	DECLARE p_name varchar(100) DEFAULT "";
	
	DECLARE ticketId INTEGER DEFAULT 56;
	DECLARE ownerID INTEGER DEFAULT 0;
 
    
    DEClARE log_cursor CURSOR FOR 
        SELECT caller_first_name FROM satlog.logs limit 0, 10;		
 
    
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET log_finished = 1;
 
    OPEN log_cursor;
 
    get_log: LOOP
 
        FETCH log_cursor INTO p_name;
 
        IF log_finished = 1 THEN 
            LEAVE get_log;
        END IF;
		
		
		CALL getMaxTicketId(ticketId);
 
        
		call insertTicket(
		ticketId,
		22,
		'store sub',
		'store content',
		27,
		'open',
		'2014-02-05 15:18:27',
		'2014-02-05 15:18:27'
		);
 
    END LOOP get_log;
 
    CLOSE log_cursor;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_counter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_counter`(INOUT count INT(4),IN inc INT(4))
BEGIN
	SET count = count + inc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateOpenTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOpenTicket`()
BEGIN

	DECLARE log_finished INTEGER DEFAULT 0;
	
	DECLARE log_id int(11) DEFAULT 0;
	DECLARE status varchar(255) DEFAULT 'open';

	
    DEClARE log_cursor CURSOR FOR 
        SELECT
			logs.id as 'log_id'
		FROM satlog.logs logs
		where 
		
		logs.resolved = 0;
		
 
    
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET log_finished = 1;

	OPEN log_cursor;
 
    get_log: LOOP

        
		FETCH log_cursor INTO log_id;
 
        IF log_finished = 1 THEN 
            LEAVE get_log;
        END IF;

		update Tickets set status = 'open' where id = log_id;
 
    END LOOP get_log;
 
    CLOSE log_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-21  0:24:57
