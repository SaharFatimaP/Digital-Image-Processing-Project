import numpy as np
from matplotlib import pyplot as plt
import math

class DepthCalculation:

    def __init__(self,filename_path,save_path): 
        self.img_array = np.load(filename_path)
        self.save_path = save_path
    
    def plot_img(self):
        plt.imshow(self.img_array, cmap='gray')
        plt.show()
        plt.imsave(self.save_path , self.img_array, cmap ='gray')
        

    def row_vec(self,x0,y0,x1,y1):
        self.vec = []
        A = np.array(self.img_array)
        for j in range(y0, y1+1):
            self.vec.append(A[x0][j])
        return self.vec

    def diagonal_vec(self,x0,y0,x1,y1):
        self.dig_vec = []
        A =np.array(self.img_array)
        for i in range(x0, x1):
            for j in range(y0, y1):
                if i == j:
                    self.dig_vec.append(A[i][j])
        return self.dig_vec

obj = DepthCalculation('C:/Users/sahar/OneDrive/Documents/university/Kaavish/npy_to_depth_images/npy_file/sahar/34.npy','C:/Users/sahar/OneDrive/Documents/university/Kaavish/npy_to_depth_images/save_depth_map/34.jpg')
print(obj.plot_img())
vec = obj.row_vec(607,76 ,607, 370)
#vec = obj.diagonal_vec(105,149,631,415)
depth_vec = np.array(vec)
print(depth_vec)

camera_config = {
    'sensor_height(mm)': 2,# width: 83.7mm
    'sensor_height(pixels)':720,# height: 1280
    'focal_length':1.88,
}

def pixel_size_in_meters(camera_config, depth):
    """
        formulas are taken from the following website:
        https://www.scantips.com/lights/subjectdistance.html
    """
    object_hight_on_sensor = camera_config['sensor_height(mm)']*1/camera_config['sensor_height(pixels)']
    pixel_size_meters = depth * object_hight_on_sensor/camera_config['focal_length']
    return pixel_size_meters


def length_of_depth_vec(depth_vec):
    depth_vec_len = len(depth_vec)
    
    total_length = 0
    
    # can be made efficient
    for i in range(depth_vec_len-1):
        # getting depth of Pixel 1 and Pixel 2 
        depth_p1 = depth_vec[i]
        depth_p2 = depth_vec[i+1]
        
        # getting depth of base of triangle
        base_pixel_depth = min((depth_vec[i],depth_vec[i+1]))
        base = pixel_size_in_meters(camera_config,base_pixel_depth)
        
        # getting height of the triangle
        height = abs(depth_p1-depth_p2)
        # pythagorean theorem

        hypotenuse = math.sqrt((height**2)+(base**2))
        total_length += hypotenuse

    # last pixel is not incorporated
    last_depth = depth_vec[-1]
    base = pixel_size_in_meters(camera_config,last_depth)
    total_length += base
    return total_length

print(length_of_depth_vec(depth_vec))
    
    
            
