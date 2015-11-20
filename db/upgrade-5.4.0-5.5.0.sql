--
-- PacketFence SQL schema upgrade from 5.4.0 to 5.5.0
--

--
-- New DHCPv6 fields for node table
--

ALTER TABLE node ADD COLUMN `dhcp6_fingerprint` VARCHAR(255) DEFAULT NULL AFTER `dhcp_fingerprint`;
ALTER TABLE node ADD COLUMN `dhcp6_enterprise` VARCHAR(255) DEFAULT NULL AFTER `dhcp_vendor`;


--
-- Alter locationlog
--

ALTER TABLE `locationlog` ADD `role` varchar(255) default NULL AFTER vlan;

--
-- Setting the major/minor/sub-minor version of the DB
--

--
-- Alter locationlog_archive
--

ALTER TABLE `locationlog_archive` ADD `role` varchar(255) default NULL AFTER vlan;

SET @MAJOR_VERSION = 5;
SET @MINOR_VERSION = 5;
SET @SUBMINOR_VERSION = 0;

--
-- The VERSION_INT to ensure proper ordering of the version in queries
--

SET @VERSION_INT = @MAJOR_VERSION << 16 | @MINOR_VERSION << 8 | @SUBMINOR_VERSION;

--
-- Updating to current version
--

INSERT INTO pf_version (id, version) VALUES (@VERSION_INT, CONCAT_WS('.', @MAJOR_VERSION, @MINOR_VERSION, @SUBMINOR_VERSION));
