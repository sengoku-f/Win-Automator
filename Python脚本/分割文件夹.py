import os
import shutil 

def mkdir(path): 
	folder = os.path.exists(path) 
	if not folder:                   #判断是否存在文件夹如果不存在则创建为文件夹
		os.makedirs(path)            #makedirs 创建文件时如果路径不存在会创建这个路径 
	else:
		pass
	
my_file = "Z:\\2019-6-19唐老鸭\\合成 1\\Thumbs.db"
if os.path.exists(my_file):
    #删除文件，可使用以下两种方法。
    os.remove(my_file)

path = "Z:\\2019-6-19唐老鸭\\合成 1"
dirs = os.listdir(path)
for index,file in enumerate(dirs):
    print(index,":",file)
    for i in range(71) :
        if 75*i <= index and index < 75*(i + 1):
            if index % 75 == 0:
                target_file = "Z:\\2019-6-19唐老鸭\\文字动画分割\\鸭_71_%s"%int(index/75)
                mkdir(target_file)
            else:
                pass
            source_file = os.path.join(path,file)
            print("source_file:",source_file)
            shutil.copy(source_file,target_file)
        else:
            pass
