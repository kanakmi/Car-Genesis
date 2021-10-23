from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
from .classify import classification

# Create your views here.

def home(request):
    if request.method=='POST':
        a = request.POST.get('noPics')
        b = []
        for i in range(int(a)):
            myfile = request.FILES[str(i)]
            fs = FileSystemStorage(location='media')
            filename = fs.save(myfile.name, myfile)
            b.append(filename)
        temp = classification(b)
        context = {
            'data':temp,
            'result':True
        }
        return render(request,'index.html',context=context)
            
    return render(request,'index.html')