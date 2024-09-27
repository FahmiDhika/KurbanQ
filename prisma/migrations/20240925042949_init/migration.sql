-- AlterTable
ALTER TABLE `transaksi` ADD COLUMN `status` ENUM('NEW', 'PAID', 'DONE') NULL DEFAULT 'NEW';
