-- AlterTable
ALTER TABLE `user` MODIFY `role` ENUM('Pelanggan', 'Penjual') NOT NULL DEFAULT 'Pelanggan';
