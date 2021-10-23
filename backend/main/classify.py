from .util import classify_image
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

prices = {
    'Head Lamp': [150, 8500],
    'Door Scratch': [80 ,1500],
    'Glass Shatter': [280, 7500],
    'Tail Lamp': [150, 8500],
    'Bumper Dent': [200, 5000],
    'Door Dent': [200, 5000],
    'Bumper Scratch': [120, 3000],
    'Labor cost per hour': [50, 1000]
}

def find_cost(l, country):
    if country=='india':
        pos = 1
    else:
        pos = 0
    
    res = {}

    total_cost = 0
    for i in l:
        res[i] = prices[i][pos]
        total_cost += prices[i][pos]
    
    res['Estimated Repair Time'] = str(len(l)) + ' hour(s)'
    res['Labor cost per hour'] = prices['Labor cost per hour'][pos]
    res['Total Estimated Cost'] = total_cost+(res['Labor cost per hour']*len(l))

    return res
    

def classification(valuesz):
    l = []
    for image in valuesz:
        fname = str(BASE_DIR)+'\media\\'+image
        print(fname)
        l.append(classify_image(fname))
    l = list(set(l))
    return find_cost(l, 'USA')


'''l.append(util.classify_image('C:/Users/kanak/Documents/pynb/Car Defects/dataset/image/17.jpeg'))

l.append(util.classify_image('C:/Users/kanak/Documents/pynb/Car Defects/dataset/image/12.jpeg'))

l.append(util.classify_image('C:/Users/kanak/Documents/pynb/Car Defects/dataset/image/14.jpeg'))

l.append(util.classify_image('C:/Users/kanak/Documents/pynb/Car Defects/dataset/image/19.jpeg'))

l = list(set(l))

print(l)

print(find_cost(l, 'USA'))'''