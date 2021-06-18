import os
import cvb

print(os.environ["CVB"])

device = cvb.DeviceFactory.open(os.path.join(os.environ["CVB"], "drivers", "CVMock.vin"))
stream = device.stream

stream.start()

for i in range(5):
    image, status = stream.wait()
    if status == cvb.WaitStatus.Ok:
        image.save(os.path.join(".", ".cvb", "test" + str(i) + ".jpg"))

stream.abort()