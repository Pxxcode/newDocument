from django.shortcuts import redirect

# Decorator
# Login
def log_in(func):
    def wrapper(request, *args, **kwargs):
        if not request.session.get("name"):
            return redirect('/login')
        return func(request, *args, **kwargs)
    return wrapper

# superuser
def authority1(func):
    def wrapper(request, *args, **kwargs):
        if request.session.get('authority') != '1':
            return redirect('error')
        return func(request, *args, **kwargs)
    return wrapper

# leader
def authority2(func):
    def wrapper(request, *args, **kwargs):
        if request.session.get('authority') != '2':
            return redirect('error')
        return func(request, *args, **kwargs)
    return wrapper

# follower
def authority3(func):
    def wrapper(request, *args, **kwargs):
        if request.session.get('authority') != '3':
            return redirect('error')
        return func(request, *args, **kwargs)
    return wrapper