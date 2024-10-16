-- AlterTable
ALTER TABLE `admin` ADD COLUMN `role` ENUM('Admin', 'Pelanggan', 'Penjual') NOT NULL DEFAULT 'Admin';

-- AlterTable
ALTER TABLE `pelanggan` ADD COLUMN `role` ENUM('Admin', 'Pelanggan', 'Penjual') NOT NULL DEFAULT 'Pelanggan';

-- AlterTable
ALTER TABLE `penjual` ADD COLUMN `role` ENUM('Admin', 'Pelanggan', 'Penjual') NOT NULL DEFAULT 'Penjual';
