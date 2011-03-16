#!/usr/bin/env python

import sys
import email

#data = sys.stdin.readlines()

data = """
Return-Path: <skk@zathras.sr.unh.edu>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on blackstar.sr.unh.edu
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL autolearn=ham
	version=3.2.5
Received: from zathras.sr.unh.edu (zathras.sr.unh.edu [132.177.241.84])
	by blackstar.sr.unh.edu (8.13.8/8.13.8) with ESMTP id p1P0TWLX028140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <skk@sr.unh.edu>; Thu, 24 Feb 2011 19:29:32 -0500
Received: from zathras.sr.unh.edu (localhost [127.0.0.1])
	by zathras.sr.unh.edu (8.14.3/8.14.3/Debian-9.4) with ESMTP id p1P0TV2o031137
	for <skk@sr.unh.edu>; Thu, 24 Feb 2011 19:29:32 -0500
Received: (from skk@localhost)
	by zathras.sr.unh.edu (8.14.3/8.14.3/Submit) id p1P0TVgY031135
	for skk@sr.unh.edu; Thu, 24 Feb 2011 19:29:31 -0500
Date: Thu, 24 Feb 2011 19:29:31 -0500
From: Steven Knight <skk@zathras.sr.unh.edu>
Message-Id: <201102250029.p1P0TVgY031135@zathras.sr.unh.edu>
To: skk@sr.unh.edu
Subject: test4

Thu Feb 24 19:29:31 EST 2011
"""

msg = email.message_from_string(data)
print msg, type(msg)
