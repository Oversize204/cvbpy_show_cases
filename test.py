import os
import cvb

print("acquire images from CVMock.vin")

device = cvb.DeviceFactory.open("/opt/cvb/drivers/CVMock.vin")
stream = device.stream

stream.start()

for i in range(5):
    image, status = stream.wait()
    if status == cvb.WaitStatus.Ok:
        image_file = os.path.join(".", ".cvb", "test" + str(i) + ".jpg")
        image.save(image_file)
        print("saving: " + image_file)

stream.abort()