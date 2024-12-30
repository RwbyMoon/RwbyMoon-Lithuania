/*
	Localisation
	Authors: MC
*/

-----------------------------------------------
-- General notes on 'localization' (or 'in-game text')

-- The entries in this file, as well as those in Civilization_Localisation.sql, are where we define the text that will actually display, in-game. Fundamentally, certain unique code strings have associated 'localisation' strings. In this file, we specify the exact string of characters that will display in place of the unique code string.

-- In all cases, localisation strings always start with LOC_ - such that we can easily tell them apart from game code.
-----------------------------------------------

INSERT INTO LocalizedText
    (Language, Tag, Gender, Plurality, Text)
VALUES

-----------------------------------------------
-- Leader Name
-----------------------------------------------	
    ('en_US',	'LOC_LEADER_RWB_VYTAUTAS_NAME',			                        'masculine:no_article',	null,			'Vytautas the Great'),
                            
    ('fr_FR',	'LOC_LEADER_RWB_VYTAUTAS_NAME',			                        'masculine:no_article', null,			'Vytautas le Grand'),
	
-----------------------------------------------
-- Leader Unique Ability
-----------------------------------------------	

    ('en_US',	'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_NAME',			        null,	                null,			'Union of Horodło'),
    ('en_US',	'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_DESCRIPTION',			null,	                null,			'Lithuanian Theater Squares and Commercial Hubs do not gain their usual Adjacencies but gain one equal to 50% of the Appeal of their tile.[NEWLINE]Buildings from the Government Plaza, Diplomatic Quarter and Encampments can be bought with [ICON_Faith] Faith. These three districts grant +0.25 [ICON_Alliance] alliance points per turn when built on Breathtaking tiles, doubled while at war.'),

    ('fr_FR',	'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_NAME',			        null,	                null,			'Union de Horodło'),
    ('fr_FR',	'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_DESCRIPTION',			null,	                null,			'Les Places du Théâtre et Plateformes Commerciales Lituaniennes ne disposent pas de leurs bonus de proximité usuels, mais en gagnent un équivalent à 50% de l’Attrait de leur case.[NEWLINE]Les bâtiments de la Place de Gouvernance, du Quartier Diplomatique et des Campements peuvent être achetés avec de la [ICON_Faith] Foi. Ces trois quartiers confèrent +0.25 [ICON_Alliance] points d''alliance par tour lorsque construites sur une case ayant un attrait époustouflant, doublés en temps de guerre.'),

-----------------------------------------------
-- Leader Agenda
-----------------------------------------------	

    ('en_US',	'LOC_AGENDA_RWB_VYTAUTAS_NAME',			                    null,	                null,			'Consolidated Sovereignity'),
    ('en_US',	'LOC_AGENDA_RWB_VYTAUTAS_DESCRIPTION',			            null,	                null,			'Always tries to keep the maximum number of districts in each city while maintaining a significant military. Will appreciate those who do the same, and find underwhelming those who don''t.'),

    ('en_US',	'LOC_DIPLO_KUDO_LEADER_RWB_VYTAUTAS_REASON_ANY',			null,	                null,			'(You have a strong military and a large amount of districts.)'),
    ('en_US',	'LOC_DIPLO_MODIFIER_RWB_VYTAUTAS_HAPPY',			        null,	                null,			'I see in you a ruler who guards their lands fiercely, and has a united, thriving people. True sovereignty deserves my respect and admiration.'),
    
    ('en_US',	'LOC_DIPLO_WARNING_LEADER_RWB_VYTAUTAS_REASON_ANY',			null,	                null,			'(You have a weak military and a low amount of districts.)'),
    ('en_US',	'LOC_DIPLO_MODIFIER_RWB_VYTAUTAS_UNHAPPY',			        null,	                null,			'You lack autority and guidance over your people; it seems you want invite calamity to tear through their little castles of sand.'),

    
    
    ('fr_FR',	'LOC_AGENDA_RWB_VYTAUTAS_NAME',			                    null,	                null,			'Souveraineté Consolidée'),
    ('fr_FR',	'LOC_AGENDA_RWB_VYTAUTAS_DESCRIPTION',			            null,	                null,			'Tente toujours de maintenir le maximum de quartiers dans chaque ville tout en conservant une force militaire significative. Appréciera ceux qui font de même et trouvera décevants ceux qui ne le font pas.'),
    
    ('fr_FR',	'LOC_DIPLO_KUDO_LEADER_RWB_VYTAUTAS_REASON_ANY',			null,	                null,			'(Vous avez une armée puissante et un grand nombre de quartiers.)'),
    ('fr_FR',	'LOC_DIPLO_MODIFIER_RWB_VYTAUTAS_HAPPY',			        null,	                null,			'Je vois en vous un dirigeant qui protège farouchement ses terres et qui règne sur un peuple uni et prospère. Une véritable souveraineté mérite mon respect et mon admiration.'),
    
    ('fr_FR',	'LOC_DIPLO_WARNING_LEADER_RWB_VYTAUTAS_REASON_ANY',			null,	                null,			'(Vous avez une armée faible et un petit nombre de quartiers.)'),
    ('fr_FR',	'LOC_DIPLO_MODIFIER_RWB_VYTAUTAS_UNHAPPY',			        null,	                null,			'Vous manquez d''autorité et de guidance sur votre peuple ; vous semblez inviter le désastre à balayer leurs petits châteaux de sable.'),


-----------------------------------------------
-- Dawn of Man (Loading Screen) Text
-----------------------------------------------	

    ('en_US',	'LOC_LOADING_INFO_LEADER_RWB_VYTAUTAS',			null,	                null,			'By your ambition you live, Grand-Duke Vytautas. Lithuania look to you not only as The Great general into war, but also as their reformator uniting boyar nobles under your martial valour. Go, use your statesmanlike foresight, centralize your people''s faith and become the blade of the lithuanian consciousness.'),

    
    ('fr_FR',	'LOC_LOADING_INFO_LEADER_RWB_VYTAUTAS',			null,	                null,			'Par votre ambition vous vous épanouissez, Grand-Duc Vytautas. Vous n''êtes pas que Le Grand aux yeux de la Lituanie en tant que général, mais aussi comme un réformateur, unissant les boyars nobles sous votre valeur martiale. Allez, usez de votre finesse politique, centralisez la foi de votre peuple et incarnez la lame de la conscience lituanienne.'),

-----------------------------------------------
-- Diplomacy Text: First Meet
-----------------------------------------------	

	-- First AI Line (ANY)
    ('en_US',	'LOC_DIPLO_FIRST_MEET_LEADER_RWB_VYTAUTAS_ANY',			                                null,	                null,			'I am Vytautas, Grand Duke of Lithuania, protector of our sacred lands. My deeds shape nations; my words seal their fate. State your purpose.'),
    ('fr_FR',	'LOC_DIPLO_FIRST_MEET_LEADER_RWB_VYTAUTAS_ANY',			                                null,	                null,			'Je suis Vytautas, Grand-Duc de Lituanie, protecteur de nos terres sacrées. Mes actes façonnent les nations, mes paroles scellent leur destin. Exposez votre objectif.'),

	-- AI invitation to visit nearby City (ANY)
    ('en_US',	'LOC_DIPLO_FIRST_MEET_VISIT_RECIPIENT_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Come and see the castles and the upper towns of our cities. Shall you visit our territory and witnessi their flourishing population?'),
    ('fr_FR',	'LOC_DIPLO_FIRST_MEET_VISIT_RECIPIENT_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Venez voir les châteaux et les villes hautes de nos cités. Voulez-vous visiter notre territoire et témoigner de leur population florissante ?'),

	-- AI accepts human invitation (ANY)
    ('en_US',	'LOC_DIPLO_FIRST_MEET_NEAR_INITIATOR_POSITIVE_LEADER_RWB_VYTAUTAS_ANY',			            null,	                null,			'Your gesture is noted. I shall see what greatness your lands hold.'),
    ('fr_FR',	'LOC_DIPLO_FIRST_MEET_NEAR_INITIATOR_POSITIVE_LEADER_RWB_VYTAUTAS_ANY',			            null,	                null,			'Votre geste est noté. J''observerai la grandeur de vos terres.'),
	
	-- AI invitation to exchange Capital Information (ANY)
    ('en_US',	'LOC_DIPLO_FIRST_MEET_NO_MANS_INFO_EXCHANGE_LEADER_RWB_VYTAUTAS_ANY',			            null,	                null,			'Let us exchange the knowledge of our capitals. Transparency is the first step to trust.'),
    ('fr_FR',	'LOC_DIPLO_FIRST_MEET_NO_MANS_INFO_EXCHANGE_LEADER_RWB_VYTAUTAS_ANY',			            null,	                null,			'Échangeons la connaissance de nos capitales. La transparence est la première étape vers la confiance.'),

-----------------------------------------------
-- Diplomacy Text: Greetings
-----------------------------------------------	

	-- (HAPPY)
    ('en_US',	'LOC_DIPLO_GREETING_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'It is good to see you again, friend. Your wisdom continues to shape the world around you.'),
    ('fr_FR',	'LOC_DIPLO_GREETING_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'C''est un plaisir de vous revoir, ami. Votre sagesse continue de façonner le monde qui vous entoure.'),

	-- (UNHAPPY)
    ('en_US',	'LOC_DIPLO_GREETING_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Your presence stirs old tensions. Do not test Lithuania''s patience.'),
    ('fr_FR',	'LOC_DIPLO_GREETING_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Votre présence ravive de vieilles tensions. Ne testez pas la patience de la Lituanie.'),
	
-----------------------------------------------
-- Diplomacy Text: Delegation
-----------------------------------------------	

	-- AI Accepts (ANY)
    ('en_US',	'LOC_DIPLO_ACCEPT_DELEGATION_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Your delegation is welcome. They shall find our lands as fertile as they are secure.'),
    ('fr_FR',	'LOC_DIPLO_ACCEPT_DELEGATION_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Votre délégation est la bienvenue. Elle trouvera nos terres aussi fertiles que sûres.'),
	
	-- AI Rejects (ANY)
    ('en_US',	'LOC_DIPLO_REJECT_DELEGATION_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'No. Lithuania''s focus is elsewhere, on matters of greater importance.'),
    ('fr_FR',	'LOC_DIPLO_REJECT_DELEGATION_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Non. La Lituanie se concentre sur d''autres priorités plus importantes.'),
	
	-- AI Requests (ANY)
    ('en_US',	'LOC_DIPLO_DELEGATION_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'I shall send my own envoys to you. They bring honey from our forests, amber from our shores, and tales of a resilient people. Accept these as symbols of friendship and trust.'),
    ('fr_FR',	'LOC_DIPLO_DELEGATION_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Je vais envoyer mes propres émissaires. Ils apportent du miel de nos forêts, de l''ambre de nos côtes, et des récits d''un peuple résilient. Acceptez-les comme symboles d''amitié et de confiance.'),
	
-----------------------------------------------
-- Diplomacy Text: Open Borders
-----------------------------------------------	

	-- AI accepts from human (ANY)	
    ('en_US',	'LOC_DIPLO_ACCEPT_OPEN_BORDERS_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Good. Let our peoples move freely, as the rivers carve their paths through our lands.'),
    ('fr_FR',	'LOC_DIPLO_ACCEPT_OPEN_BORDERS_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Bien. Que nos peuples circulent librement, comme les rivières sculptent leurs chemins à travers nos terres.'),
	
	-- AI rejects from human (ANY)	
    ('en_US',	'LOC_DIPLO_REJECT_OPEN_BORDERS_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'No. Lithuania''s lands must remain sacred and secure.'),
    ('fr_FR',	'LOC_DIPLO_REJECT_OPEN_BORDERS_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Non. Les terres de la Lituanie doivent rester sacrées et protégées.'),
	
	-- AI requests from human (ANY)	
    ('en_US',	'LOC_DIPLO_OPEN_BORDERS_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Grant us passage through your borders. In return, our intentions shall remain honorable.'),
    ('fr_FR',	'LOC_DIPLO_OPEN_BORDERS_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Accordez-nous le passage à travers vos frontières. En retour, nos intentions resteront honorables.'),
	
-----------------------------------------------
-- Diplomacy Text: Declare Friendship
-----------------------------------------------	

	-- AI accepts from human (ANY)
    ('en_US',	'LOC_DIPLO_ACCEPT_DECLARE_FRIEND_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Yes, let us stand together, bound by respect and a vision for the future.'),
    ('fr_FR',	'LOC_DIPLO_ACCEPT_DECLARE_FRIEND_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Oui, restons unis, liés par le respect et une vision pour l''avenir.'),
	
	-- AI rejects from human (ANY)	
    ('en_US',	'LOC_DIPLO_REJECT_DECLARE_FRIEND_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'No. Friendship is earned through deeds, not words.'),
    ('fr_FR',	'LOC_DIPLO_REJECT_DECLARE_FRIEND_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Non. L''amitié se mérite par des actes, non par des mots.'),
	
	-- AI Requests friendship from human (ANY)	
	('en_US',	'LOC_DIPLO_DECLARE_FRIEND_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Let us formalize our friendship. Together, we shall illuminate these lands.'),
	('fr_FR',	'LOC_DIPLO_DECLARE_FRIEND_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Formalisons notre amitié. Ensemble, nous illuminerons ces terres.'),
	
	-- Human accepts AI requests, AI responds (ANY)	
    ('en_US',	'LOC_DIPLO_ACCEPT_DECLARE_FRIEND_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Wise and just. Together, we honor the spirit of unity that Lithuania cherishes.'),    
    ('fr_FR',	'LOC_DIPLO_ACCEPT_DECLARE_FRIEND_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Sage et juste. Ensemble, nous honorons l''esprit d''unité cher à la Lituanie.'),
	
	-- Human rejects AI requests, AI responds (ANY)	
    ('en_US',	'LOC_DIPLO_REJECT_DECLARE_FRIEND_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Your hesitation weakens us both. Remember this when the storms of history arrive.'),
    ('fr_FR',	'LOC_DIPLO_REJECT_DECLARE_FRIEND_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Votre hésitation nous affaiblit tous deux. Souvenez-vous-en lorsque les tempêtes de l''histoire arriveront.'),

-----------------------------------------------
-- Diplomacy Text: Alliance
-----------------------------------------------	

	-- AI Requests an alliance from human (ANY)
    ('en_US',	'LOC_DIPLO_MAKE_ALLIANCE_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'An alliance would strengthen us both, as steel sharpens steel. Will you join our cause?'),
    ('fr_FR',	'LOC_DIPLO_MAKE_ALLIANCE_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Une alliance nous renforcerait tous deux, comme l''acier aiguise l''acier. Vous joindrez-vous à notre cause ?'),

-----------------------------------------------
-- Diplomacy Text: Kudos & Warnings
-----------------------------------------------	
	
	-- AI Kudos (ANY)
    ('en_US',	'LOC_DIPLO_KUDO_EXIT_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Your actions reflect the wisdom of a leader who understands their people.'),
    ('fr_FR',	'LOC_DIPLO_KUDO_EXIT_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Vos actions reflètent la sagesse d''un dirigeant qui comprend son peuple.'),
	
	-- AI Warnings (ANY)
    ('en_US',	'LOC_DIPLO_WARNING_EXIT_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Your choices strain the balance between us. Do not mistake restraint for weakness'),
    ('fr_FR',	'LOC_DIPLO_WARNING_EXIT_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Vos choix tendent l''équilibre entre nous. Ne prenez pas la retenue pour une faiblesse.'),

-----------------------------------------------
-- Diplomacy Text: Troops Near Border
-----------------------------------------------	
	
	-- AI warns player for border troops (HAPPY)
    ('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'Your forces near my borders raise concerns. Assure me they mean no harm.'),
    ('fr_FR',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'Vos forces près de mes frontières suscitent des inquiétudes. Assurez-moi qu''elles ne signifient aucun mal.'),

	-- AI warns player for border troops (UNHAPPY)
    ('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Remove your troops from my lands, or we shall resolve this through steel and flame.'),
    ('fr_FR',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Retirez vos troupes de mes terres, ou nous réglerons cela par l''acier et les flammes.'),
	
	-- AI accepts player's warning for border troops warning (HAPPY)
    ('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_RWB_VYTAUTAS_HAPPY',			    null,	                null,			'Your words are heard. My forces will withdraw.'),
    ('fr_FR',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_RWB_VYTAUTAS_HAPPY',			    null,	                null,			'Vos paroles sont entendues. Mes forces se retireront.'),
	
	-- AI accepts player's warning for border troops warning (UNHAPPY)
    ('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_RWB_VYTAUTAS_UNHAPPY',			null,	                null,			'Reluctantly, we will comply. Do not test my patience again.'),
    ('fr_FR',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_RWB_VYTAUTAS_UNHAPPY',			null,	                null,			'À contrecœur, nous obéirons. Ne testez pas ma patience à nouveau.'),
	
	-- AI rejects player's warning for border troops warning (ANY) ~ DECLARES WAR
    ('en_US',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Your audacity is your undoing. Prepare for war!'),
    ('fr_FR',	'LOC_DIPLO_WARNING_TOO_MANY_TROOPS_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Votre audace sera votre perte. Préparez-vous à la guerre !'),

-----------------------------------------------
-- Diplomacy Text: Settling Too Close
-----------------------------------------------	
	
	-- AI warns player for settling too close (HAPPY)
    ('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'This new city is... close. I trust this was done with cooperation in mind.'),
    ('fr_FR',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'Cette nouvelle ville est... proche. J''espère que cela a été fait dans un esprit de coopération.'),
	
	-- AI warns player for settling too close (UNHAPPY)
    ('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'You encroach on lands not yours to claim. This cannot stand.'),
    ('fr_FR',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Vous empiétez sur des terres qui ne vous appartiennent pas. Cela ne peut pas durer.'),
	
	-- Positive AI response to human request (HAPPY)
    ('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'Very well. Lithuania will honor this request for the sake of peace.'),
    ('fr_FR',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'Très bien. La Lituanie honorera cette demande pour le bien de la paix.'),
	
	-- Positive AI response to human request (UNHAPPY)
    ('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Fine. But know this is the last concession you shall receive.'),
    ('fr_FR',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_POSITIVE_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'D''accord. Mais sachez que c''est la dernière concession que vous recevrez.'),
	
	-- Negative AI response to human request (HAPPY)
    ('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'No. Lithuania''s destiny requires this course of action.'),
    ('fr_FR',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'Non. Le destin de la Lituanie exige ce cours d''action.'),
	
	-- Negative AI response to human request (UNHAPPY)
    ('en_US',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Absolutely not. Your demands insult Lithuania''s sovereignty.'),
    ('fr_FR',	'LOC_DIPLO_WARNING_DONT_SETTLE_NEAR_ME_AI_RESPONSE_NEGATIVE_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Absolument pas. Vos demandes insultent la souveraineté de la Lituanie.'),
	
-----------------------------------------------
-- Diplomacy Text: Trade
-----------------------------------------------	

	-- AI Accepts Deal (HAPPY)
    ('en_US',	'LOC_DIPLO_ACCEPT_MAKE_DEAL_FROM_AI_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'A fair deal, crafted with mutual respect. May it bring prosperity to both.'),
    ('fr_FR',	'LOC_DIPLO_ACCEPT_MAKE_DEAL_FROM_AI_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'Un accord juste, forgé avec respect mutuel. Qu''il apporte prospérité aux deux parties.'),
    
	-- AI Accepts Deal (Unhappy)
    ('en_US',	'LOC_DIPLO_ACCEPT_MAKE_DEAL_FROM_AI_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'This deal does not meet Lithuania''s needs. Let us discuss further.'),
    ('fr_FR',	'LOC_DIPLO_ACCEPT_MAKE_DEAL_FROM_AI_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Cela suffit pour l''instant. Ne vous attendez pas à une telle générosité à nouveau.'),

	-- AI Rejects Deal (HAPPY)
    ('en_US',	'LOC_DIPLO_REJECT_MAKE_DEAL_FROM_AI_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'This suffices for now. Do not expect charity in such negotiations.'),
    ('fr_FR',	'LOC_DIPLO_REJECT_MAKE_DEAL_FROM_AI_LEADER_RWB_VYTAUTAS_HAPPY',			                    null,	                null,			'Cet accord ne répond pas aux besoins de la Lituanie. Discutons davantage.'),
    
	-- AI Rejects Deal (Unhappy)
    ('en_US',	'LOC_DIPLO_REJECT_MAKE_DEAL_FROM_AI_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Your offer is an insult to Lithuania''s stature. We will not entertain it.'),
    ('fr_FR',	'LOC_DIPLO_REJECT_MAKE_DEAL_FROM_AI_LEADER_RWB_VYTAUTAS_UNHAPPY',			                    null,	                null,			'Votre offre est une insulte à la stature de la Lituanie. Nous ne l''accepterons pas.'),

-----------------------------------------------
-- Diplomacy Text: Denounce
-----------------------------------------------	

	-- Human denounce, AI responds
    ('en_US',	'LOC_DIPLO_DENOUNCE_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'So, you reveal your intentions. Lithuania will remember this treachery.'),
    ('fr_FR',	'LOC_DIPLO_DENOUNCE_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Ainsi, vous révélez vos intentions. La Lituanie se souviendra de cette trahison.'),
	
	-- From AI
    ('en_US',	'LOC_DIPLO_DENOUNCE_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'I, hereby, denounce your actions to the rest of the nobility! Your schemes betray your people and your honor.'),
    ('fr_FR',	'LOC_DIPLO_DENOUNCE_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Je vous dénonce ! Vos actions trahissent votre peuple et votre honneur.'),
	
-----------------------------------------------
-- Diplomacy Text: Declarations of War
-----------------------------------------------	

	-- Human Declares War, AI responds
    ('en_US',	'LOC_DIPLO_DECLARE_WAR_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'You challenge Lithuania? You will find only ruin awaiting you.'),
    ('fr_FR',	'LOC_DIPLO_DECLARE_WAR_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Vous défiez la Lituanie ? Vous ne trouverez que ruine sur votre chemin.'),
	
	-- AI Declares War
    ('en_US',	'LOC_DIPLO_DECLARE_WAR_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'You leave me no choice. Lithuania marches to war for its honor and survival.'),
    ('fr_FR',	'LOC_DIPLO_DECLARE_WAR_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Vous ne me laissez pas le choix. La Lituanie marche à la guerre pour son honneur et sa survie.'),

-----------------------------------------------
-- Diplomacy Text: Make Peace
-----------------------------------------------	
	
	-- AI accepts from human
    ('en_US',	'LOC_DIPLO_MAKE_PEACE_AI_ACCEPT_DEAL_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Peace is wise. Let us turn from war and build anew.'),
    ('fr_FR',	'LOC_DIPLO_MAKE_PEACE_AI_ACCEPT_DEAL_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'La paix est sage. Tournons-nous vers l''avenir et construisons à nouveau.'),
	
	-- AI refuses human
    ('en_US',	'LOC_DIPLO_MAKE_PEACE_AI_REFUSE_DEAL_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Not while your crimes remain unpunished.'),
    ('fr_FR',	'LOC_DIPLO_MAKE_PEACE_AI_REFUSE_DEAL_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Pas tant que vos crimes resteront impunis.'),
	
	-- AI requests from human
    ('en_US',	'LOC_DIPLO_MAKE_PEACE_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Enough blood has been shed. Let us end this conflict and seek a better path.'),
    ('fr_FR',	'LOC_DIPLO_MAKE_PEACE_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Assez de sang a été versé. Mettons fin à ce conflit et cherchons un meilleur chemin.'),

-----------------------------------------------
-- Diplomacy Text: Defeat
-----------------------------------------------	
	
	-- AI is Defeated
    ('en_US',	'LOC_DIPLO_DEFEAT_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'You may claim Lithuania''s lands, but our spirit endures. History will vindicate us.'),
    ('fr_FR',	'LOC_DIPLO_DEFEAT_FROM_AI_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'Vous pouvez revendiquer les terres de la Lituanie, mais notre esprit endure. L''histoire nous rendra justice.'),

	-- Human is Defeated (will see this in hotseat)
    ('en_US',	'LOC_DIPLO_DEFEAT_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'{LOC_DIPLO_DEFEAT_FROM_AI_LEADER_RWB_VYTAUTAS_ANY}'),
    ('fr_FR',	'LOC_DIPLO_DEFEAT_FROM_HUMAN_LEADER_RWB_VYTAUTAS_ANY',			                    null,	                null,			'{LOC_DIPLO_DEFEAT_FROM_AI_LEADER_RWB_VYTAUTAS_ANY}'),

--------------------------------------------------------------------
-- Leader Quote and Civilopedia Text
--------------------------------------------------------------------
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_RWB_VYTAUTAS_QUOTE',			                    null,	                null,			'Statehood builds strength, faith builds purpose, but it is our unity and resolve that builds legacies.'),
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_RWB_VYTAUTAS_TITLE',			                    null,	                null,			'Vytautas the Great'),
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_RWB_VYTAUTAS_SUBTITLE',			                    null,	                null,			'Grand-Duke of Lithuania'),
    
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_CAPSULE_BODY',			                    null,	                null,			'Lithuania excels at transforming wetlands into an appealing domain, allowing it to develop populous and flexible cities with constant bursts of [ICON_Faith] Faith. Vytautas then seeks to secure his position by locking his neighbors into alliances and maintaining a menacing military presence.'),
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_DETAILED_BODY',			                    null,	                null,			'The first thing to do in every city is to place a Piliakalnis district on a Breathtaking tile, which should come easy when paying attention with the Appeal Lens, but beware as Lithuania''s bonus Appeal only applies to tiles you own. Combined with the [ICON_Food] Food and Appeal it gives, Lithuania can pursue any sort of early or mid-game strategy thanks to Vytautas'' faith purchase, alternative adjacencies, the safety net that Piliakalniai and the Vytis horsemen provide but also the flexibility of your large reserves of [ICON_Faith] Faith. [NEWLINE]As Vytautas, it''s important to also consider the speed at which he can establish military with [ICON_Faith] Faith (purchasing encampment buildings and the Grandmaster''s Chapel to then purchase units and great generals.) to then safely conquer neighbors, in the range of your Piliakalniai. Vytautas can grow the best alliances faster than anyone else, locking opponents into high level alliances that you can easily gain large benefits from and keeping them from attacking you. '),
    
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_1',			                    null,	                null,			'Vytautas the Great, the Grand Duke of Lithuania, is remembered as one of the most formidable and ambitious rulers in Eastern Europe during the 14th and 15th centuries. His reign transformed Lithuania into a powerful and expansive state, and his leadership cemented his legacy as a national hero. Vytautas is often revered as the architect of Lithuania''s golden age, a time when it spanned the largest territorial expanse in its history, covering much of modern-day Belarus, Ukraine, and parts of Poland and Russia.'),
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_2',			                    null,	                null,			'Vytautas was born into the Lithuanian royal family around 1350, during a time of political instability and external threats. Lithuania, at this point, was a relatively young and fragmented entity, threatened by both the Teutonic Order in the west and the Mongol Empire in the east. From an early age, Vytautas was thrust into the turbulent world of power struggles and wars. His early life was marked by exile and conflict with his cousin, Władysław II Jagiełło, who later became King of Poland. Vytautas, seeking to assert his dominance, fought for the Lithuanian throne and engaged in a complex power struggle with Jogaila, even aligning himself with the Teutonic Order at one point.'),
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_3',			                    null,	                null,			'Vytautas’ reign was defined by his remarkable ability to navigate this turbulent political landscape. He sought to strengthen Lithuania through both military conquest and strategic alliances. In 1386, he entered into a pivotal agreement with Poland, the Union of Krewo, which saw Jogaila marry Queen Jadwiga of Poland and convert to Christianity, beginning the process of Christianization in Lithuania. Though Vytautas himself remained pagan for much of his life, his political acumen ensured that Lithuania was not isolated in the European political order.'),
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_4',			                    null,	                null,			'However, Vytautas'' primary ambition was the consolidation and expansion of his domain. Under his leadership, Lithuania became a force to be reckoned with in the region. Vytautas successfully waged wars against the Teutonic Knights, ultimately leading the Lithuanian forces to victory at the Battle of Grunwald in 1410, a decisive clash that crippled the Teutonic Order and marked a turning point in Lithuanian history. The victory at Grunwald, achieved through careful alliances with Poland, played a significant role in the weakening of the Teutonic Order and the establishment of Lithuanian dominance in the Baltic region.'),
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_5',			                    null,	                null,			'In addition to his military conquests, Vytautas was also a visionary ruler in terms of governance. He enacted several reforms to strengthen the central authority of the Grand Duchy, building a more efficient administrative system and promoting economic growth. Vytautas also worked to establish a lasting peace with the neighboring countries, navigating the complex politics of Eastern Europe by forming alliances with Poland, Moscow, and even the Crimean Khanate.'),
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_6',			                    null,	                null,			'Despite his successes, Vytautas'' reign was not without challenges. His desire to expand Lithuania often put him at odds with his Polish allies, and he faced internal resistance from the Lithuanian nobility who were wary of his power. Vytautas died in 1430, leaving behind a legacy of territorial expansion, military prowess, and political diplomacy. His death marked the end of Lithuania''s most significant period of growth, and after his passing, the Grand Duchy’s power began to gradually wane.'),
    ('en_US',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_7',			                    null,	                null,			'Vytautas the Great''s legacy is one of strength, strategy, and ambition. His reign is celebrated as the high point of Lithuania''s medieval power, and he remains a key figure in the history and national identity of Lithuania, revered for his ability to unite a vast and diverse land and make it a significant player on the European stage.'),


    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_RWB_VYTAUTAS_QUOTE',			                    null,	                null,			'La souveraineté construit la force, la foi construit le but, mais c''est notre unité et notre détermination qui construisent des héritages.'),
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_RWB_VYTAUTAS_TITLE',			                    null,	                null,			'Vytautas le Grand'),
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_RWB_VYTAUTAS_SUBTITLE',			                    null,	                null,			'Grand-Duc de Lituanie'),
    
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_CAPSULE_BODY',			                    null,	                null,			'La Lituanie excelle à transformer des terres marécageuses en un royaume attrayant, lui permettant de développer des villes très peuplées, flexibles avec des apports constants de [ICON_Faith] Foi. Vytautas cherche alors à sécuriser sa position en verrouillant la posture de ses voisins avec des alliances et une armée menaçante.'),
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_DETAILED_BODY',			                    null,	                null,			'Dans chaque ville, la première chose à faire est de placer un Piliakalnis sur une case à l''attrait Époustouflant. Cela devrait être facile en utilisant la Lentille d’Attrait, mais attention car le bonus d''Attrait de la Lituanie ne s''applique qu''aux cases que vous possédez. Combiné à la [ICON_Food] Nourriture et à l''Attrait qu''il offre, la Lituanie peut poursuivre n''importe quelle stratégie en début ou milieu de partie grâce aux achats de foi de Vytautas, ses bonus de proximités alternatifs, au filet de sécurité que procurent les Piliakalniai et les cavaliers Vytis, mais aussi à la flexibilité offerte par vos grandes réserves de [ICON_Faith] Foi.[NEWLINE]En jouant Vytautas, il est également important de considérer la rapidité avec laquelle il peut établir une force militaire grâce à la [ICON_Faith] Foi (achat de bâtiments de Campements et de la Chapelle du Grand Maître pour ensuite acheter des unités et des Généraux Illustres) afin de conquérir en toute sécurité vos voisins, à portée de vos Piliakalniai. Vytautas peut former de meilleures alliances plus rapidement que quiconque, enfermant ses adversaires dans des alliances de haut niveau qui vous procurent de grands avantages tout en les empêchant de vous attaquer.'),
    
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_1',			                    null,	                null,			'Vytautas le Grand, le Grand-Duc de Lituanie, est reconnu comme l''un des souverains les plus redoutables et ambitieux de l''Europe de l''Est aux XIVe et XVe siècles. Son règne transforma la Lituanie en un État puissant et expansif, et son leadership cimenta son héritage en tant que héros national. Vytautas est souvent vénéré comme l''architecte de l''âge d''or de la Lituanie, une époque où elle s''étendait sur la plus grande superficie territoriale de son histoire, couvrant une grande partie de la Biélorussie, de l''Ukraine, ainsi que des parties de la Pologne et de la Russie actuelles.'),
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_2',			                    null,	                null,			'Vytautas est né dans la famille royale lituanienne vers 1350, à une époque d’instabilité politique et de menaces extérieures. À ce moment-là, la Lituanie était une entité relativement jeune et fragmentée, menacée à la fois par l''Ordre Teutonique à l''ouest et l''Empire mongol à l''est. Dès son plus jeune âge, Vytautas fut plongé dans le monde turbulent des luttes de pouvoir et des guerres. Sa jeunesse fut marquée par l''exil et les conflits avec son cousin, Ladislas II Jagellon, qui devint plus tard roi de Pologne. Vytautas, cherchant à affirmer sa domination, se battit pour le trône lituanien et engagea une lutte complexe pour le pouvoir avec Jagellon, s’alliant même à l''Ordre Teutonique à un moment donné.'),
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_3',			                    null,	                null,			'Le règne de Vytautas se caractérisa par sa remarquable capacité à naviguer dans ce paysage politique tumultueux. Il chercha à renforcer la Lituanie à travers à la fois la conquête militaire et des alliances stratégiques. En 1386, il conclut un accord décisif avec la Pologne, l''Union de Krewo, qui vit Jagellon épouser la reine Hedwige de Pologne et se convertir au christianisme, amorçant ainsi le processus de christianisation en Lituanie. Bien que Vytautas lui-même soit resté païen pendant une grande partie de sa vie, sa perspicacité politique assura que la Lituanie ne soit pas isolée dans l''ordre politique européen.'),
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_4',			                    null,	                null,			'HCependant, l''ambition principale de Vytautas était la consolidation et l''expansion de son domaine. Sous son leadership, la Lituanie devint une force avec laquelle il fallait compter dans la région. Vytautas mena avec succès des guerres contre les chevaliers teutoniques, menant finalement les forces lituaniennes à la victoire lors de la bataille de Grunwald en 1410, un affrontement décisif qui affaiblit l''Ordre Teutonique et marqua un tournant dans l''histoire de la Lituanie. La victoire de Grunwald, obtenue grâce à des alliances soigneusement établies avec la Pologne, joua un rôle important dans l''affaiblissement de l''Ordre Teutonique et l''établissement de la domination lituanienne dans la région baltique.'),
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_5',			                    null,	                null,			'En plus de ses conquêtes militaires, Vytautas était également un souverain visionnaire en matière de gouvernance. Il mit en place plusieurs réformes pour renforcer l''autorité centrale du Grand-Duché, établissant un système administratif plus efficace et promouvant la croissance économique. Vytautas travailla également à établir une paix durable avec les pays voisins, naviguant dans la politique complexe de l''Europe de l''Est en formant des alliances avec la Pologne, Moscou et même le Khanat de Crimée.'),
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_6',			                    null,	                null,			'Malgré ses succès, le règne de Vytautas ne fut pas exempt de défis. Son désir d''étendre la Lituanie le mit souvent en conflit avec ses alliés polonais, et il affronta une résistance interne de la part de la noblesse lituanienne, méfiante de son pouvoir. Vytautas mourut en 1430, laissant derrière lui un héritage d''expansion territoriale, de prouesse militaire et de diplomatie politique. Sa mort marqua la fin de la période de croissance la plus significative de la Lituanie, et après son décès, le pouvoir du Grand-Duché commença à s’affaiblir progressivement.'),
    ('fr_FR',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_CHAPTER_HISTORY_PARA_7',			                    null,	                null,			'L''héritage de Vytautas le Grand est celui de la force, de la stratégie et de l''ambition. Son règne est célébré comme le point culminant du pouvoir médiéval de la Lituanie, et il demeure une figure clé dans l’histoire et l''identité nationale de la Lituanie, vénéré pour sa capacité à unir une terre vaste et diversifiée et à en faire un acteur significatif sur la scène européenne.');