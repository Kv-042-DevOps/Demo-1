Name:           demo1-dev-init
Version:	1        
Release:        1%{?dist}
Summary:        Example
License:        BSD
URL:		http://softserveinc.com            	       
BuildArch:	noarch

Requires:	rpm-build epel-release postgresql postgresql-server postgresql-libs postgresql-contrib postgresql-devel python python-pip git
  
%description	
%{name} - demo1-dev-init

%prep



%build


%install
sudo pip install --upgrade pip setuptools
sudo pip install virtualenv
sudo pip install django

%post




%files


%doc


%changelog
* Mon Aug 6 2018 glad
- buils init env for developer
