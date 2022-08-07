---
layout: post
category: Tech Stuff
title: My Experience Setting Up My Very Own Server!
bordercolor: "#92d07c"
permalink: /website-server-setup/

---

### **Rate My Frogs**

About a year ago, I had a silly idea about a website whose sole purpose would be
for rating frogs. I used my newfound understanding of web frameworks, and with
the help of a couple of friends, had made my idea into reality! My next step was
going to be to deploy to the web so I could show the website to anyone. Being
the ambitious yet fairly naive student I am, I figured I could cut costs by
purchasing a raspberry pi and set up my very own server to host my websites on
it. And I'm certainly better off for it – even though I temporarily moved away from 
using the raspberry pi, I learned a lot about linux server setup, firewalls,
reverse proxies, and DNS. This brings me to the next part of my server setup
adventure.<br><br>


### **Donkey Kong December**

Silly website ideas are best fueled by impulsive silly domain name purchases 
(which are my favorite kind!). One such example for me was
donkeykongdecember.com, a website intended to tell the user if it is currently
december or not. Needless to say, once I had bought the domain, I knew what I
wanted to create, and tasked myself with creating and deploying it in under an
hour. Luckily for me, my university has freely accessible server space for
students to upload websites/projects. In the hour I used to create and deploy
the website, and I had called the project a success. Of course, the one drawback
is that web deployment on the school server was restricted to users within the
premises of the campus, a problem I soon stumbled upon trying to show it to a
few of my city friends.<br><br>


### **Rate My Frogs version 2.0**

Flash forward a month in early April, a couple of weeks before my birthday. I
decided to surprise my friends with a new and improved version of
ratemyfrogs.com. By that time in the month, the previous version had been down
for almost 6 months, mostly due to troubles hosting on the raspberry pi. After
completing a new and improved website, the host I chose doesn't really matter 
(they're all pretty 
much the same), the important thing is that the past problems I had with each 
new website I made cascaded into the decision to make that purchase.<br><br>


### **Carpool Bot**

I took a small break from websites to develop a discord bot with a new discord
python library I found. Admittedly it's still a bit buggy at the time of writing
this, but it's something I hope to take another look at in the future. <br><br>


### **Gitea**

My latest development, learning how git remote servers work! This stemmed mostly
from curiosity on self-hosted git, and started off as a project to try to make
my own git server front-end! Admittedly I ended up using gitea, an existing
solution, over anything I built, but in the end that allowed me to spend more time
understanding how remote git servers work. I hope to port the site to https
sometime soon, and use it as a portfolio of carefully curated projects for
visitors to my website to see!<br><br>


### **emilkovacev.com**

Yes, my personal website is next! With my server, I am going to add a few more
features to my website to make it more interactive (I'm thinking of an email
notification form?) It was initially written in Jekyll so I could host on GitHub
Pages for free, but now I use it because I made a custom theme for it 
(emilkovacev/aeroplane)!<br><br>


### **But Why?**

"Enough with the storytelling already" you must be thinking. And I suppose
you're right, the story isn't quite as compelling as the act of doing it
yourself. But I hope those excertps showed you even just a small bit of 
insight into how I ended up learning these concepts, and why they're important
to me. Having fun with websites was a better motivator for me than any strict
regimen or habitual motivation could ever be.<br><br>


### **Prerequisites**

I am assuming that readers of this post are familiar with the linux command
line, to the point of understanding general shell commands.<br><br>


### **The How**

Here's the step-by-step tutorial you may be looking for. Instead of focusing 
on the general case, here's how I deployed ratemyfrogs.com!

1. I used DigitalOcean for my newest server, but was previously (at the time of
   writing this article) a Linode user. Both services are fairly simple to setup, 
   but I think DigitalOcean can be more affordable.

2. For digitalocean, you need to create a droplet to host your project on. A 
   "droplet" is DigitalOcean's fancy name for a server. I recommend using Ubuntu
   20.04 if you haven't tinkered around with using other distros before. (Note,
   RateMyFrogs.com uses MongoDB, which currently does not support Ubuntu 22.04
   yet. DigitalOcean defaults to v22.04 when you select it, so be sure to change
   it if you want it to run properly).

3. SSH into your vm. SSH is essentially your method of entering the vm remotely. 
   Any time you want to remotely access a droplet (server) by its ip address, you can use the
   ssh command. In this case, since we are using ubuntu, the base
   user is *root*, and our ip address (alternatively listed as ipv4) should be 
   listed with the droplet. 
   Run the ssh command 

   `$ ssh root@&lt;ip&gt;`

   to access the your vm with ip address <ip>, as 
   the root user. Enter your the password from earlier when prompted. 
   You may be prompted to confirm your connection if "the
   authenticity of the host can't be established", in which case you type `yes`
   and continue. By now, you should recieve a prompt that confirms that you have
   successfully accessed the linode server.


4. Now it's time to setup a user for yourself, so you don't use root all the 
   time. Why shouldn't you continue to use root? Root access is pretty powerful,
   meaning you would have pretty unlimited access to important files and the
   ability to delete files you may not want to delete. Use the command `sudo
   adduser <username>`, where `<username>` is the username you choose for your
   user. The command line will then prompt you for a few details regarding your
   new user, fill them in appropriately, and if you want to skip a question
   click `Enter`.

4. Now it's time to install all prerequisite software! First, we need to install
   MongoDB. I used [this](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)
   tutorial to install it:

   1. Import the public key used by the package management system:<br>
      `$ wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -`

   2. Create a list file for MongoDB:<br>
      `$ echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list`
   
   3. Reload local package database:<br>
      `$ sudo apt-get update`

   4. Install the MongoDB packages:<br>
      `$ sudo apt-get install -y mongodb-org`


   Now we want to install nginx:

   1. `$ sudo apt update`
   2. `$ sudo apt install nginx`


5. Clone the [repo for ratemyfrogs.com](https://github.com/emilkovacev/ratemyfrogs).
   Switch to the `rework` branch. The following instructions are also in the
   README.md file.

   1. setup a venv<br/>
      `$ python -m venv venv`

   2. install requirements<br/>
      `$ python3 -m pip install -r requirements.txt`

   3. *We already set up MongoDB from earlier, so we can skip this step!*

   4. Run the server 
      `uvicorn server:app --port=5001`



9. Change the DNS in your domain provider to reflect the correct ip address. I
   prefer cloudflare for the free ssl proxies, but any alternative works.
   Generally speaking, this is usually an A record with the host being @
   (home) and the "points to" is the public-facing server ip.

**If you completed steps 1-9, you should have a fully-functioning live
deployed website!**



– Emil Lars Kovačev<br><br>

