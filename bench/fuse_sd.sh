
#Copy the image to current directory
cp ../spl/itop4412-spl.bin ./
cp ../u-boot.bin ./


#Concatenate the images together
#cat E4412_N.bl1.SCP2G.bin itop4412-spl.bin > combine-spl.bin
cat E4412_N.bl1.bin itop4412-spl.bin > combine-spl.bin


#Fuse the images to the SD card
dd if=/dev/zero of=/dev/sdb bs=512 seek=0 iflag=dsync oflag=dsync count=2048
dd if=combine-spl.bin of=/dev/sdb bs=512 seek=1 iflag=dsync oflag=dsync
dd if=u-boot.bin of=/dev/sdb bs=512 seek=65 iflag=dsync oflag=dsync
sync
eject /dev/sdb

