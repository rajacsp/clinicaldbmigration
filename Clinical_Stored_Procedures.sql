-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rt4_clinical_2
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



DROP PROCEDURE IF EXISTS  rt4_clinical_3.addUnique;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.checkMismatchedTickets;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.cleanAttachmentsTable;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.cleanTicketBundle;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.cleanTicketsTable;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.copyCustomFieldsForMedication;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.copyCustomFieldsForProgramPhases;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.copyCustomFieldsWithoutMedication;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.copySatLogBasicTickets;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.copySatLogCustomFields;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.CopySatLogUsers;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.createCustomFieldValuesForMedication;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.createCustomFieldValuesForProgramPhase;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.createCustomFieldValuesWithoutMedication;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.createSingleCustomField;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.createTicketAndDependencies;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.getClinicalOwnerId;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.getMaxTicketId;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.getMaxTransactionId;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.getNewUserId;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.handlerdemo;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.insertAttachment;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.insertSampleCustomField;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.insertSampleTicket;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.insertTicket;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.insertTransaction;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.loop_logs;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.set_counter;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.updateOpenTicket;
DROP PROCEDURE IF EXISTS  rt4_clinical_3.createSpecialSingleCustomField;

--
-- Dumping routines for database 'rt4_clinical_2'
--
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
	call cleanAttachmentsTable(); 
	delete from Transactions where ObjectType = 'RT::Ticket'; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-16  4:10:17
