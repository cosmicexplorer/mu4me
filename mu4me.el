;;; mu4me.el --- giving mu4e a makeover -*- lexical-binding: t -*-

;; Author: Danny McClanahan
;; Version: 0.1
;; URL: https://github.com/cosmicexplorer/mu4me
;; Package-Requires: ((emacs "25.3") (cl-lib "0.5") (dash "2.13") (mu4e-column-faces "1.2") (mu4e))
;; Keywords: <TODO>

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; <TODO>


;; Usage:

;; <TODO>


;; License:

;; GPL 3.0 or any later version.

;; End Commentary


;;; Code:

;; NB: mu4e is provided by the OS package manager with mu, *not* from m?elpa: see
;; https://www.djcbsoftware.nl/code/mu/mu4e/Installation.html.
(require 'mu4e)
(require 'mu4e-column-faces)

(require 'cl-lib)
(require 'dash)


;; ???

;;; top of thread:
;; (fontified t msg
;;  (:path "/home/cosmicexplorer/.mail/INBOX/new/1680890658_11.30257.lightning-strike-teravolts,U=123,FMD5=7e33429f656f1e6e9d79b29c3f82c57e:2,"
;;   :size 8081
;;   :list-post ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com"))
;;   :reply-to ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com" :name "spack/spack"))
;;   :cc ((:email "algorithmicextremism@pm.me" :name "Danny McClanahan") (:email "review_requested@noreply.github.com" :name "Review requested"))
;;   :changed (25648 23330 0)
;;   :date (25574 47145 0)
;;   :from ((:email "notifications@github.com" :name "spackbot-app[bot]"))
;;   :list "spack.spack.github.com"
;;   :message-id "spack/spack/pull/35450/c1426370862@github.com"
;;   :priority low
;;   :references ("spack/spack/pull/35450@github.com")
;;   :subject "Re: [spack/spack] Make recipes consistent w.r. libintl, iconv, gettext (PR #35450)"
;;   :to ((:email "spack@noreply.github.com" :name "spack/spack"))
;;   :maildir "/INBOX"
;;   :flags (new unread list personal)
;;   :docid 2148
;;   :meta (
;;     :path "14f:fff:z"
;;     :level 1
;;     :date "n63e6b829"
;;     :data-tstamp (0 0 0)
;;     :first-child t
;;     :orphan t
;;     :thread-subject t))
;;  invisible t docid 2148)

;;; branching node in thread:
;; (fontified t docid 553 msg
;;   (:path "/home/cosmicexplorer/.mail/Sent/cur/1680890683_7.30481.lightning-strike-teravolts,U=47,FMD5=7f8c0283f16925caed8e632086b81b9c:2,S"
;;    :size 118829
;;    :reply-to ((:email "dmcc2@hypnicjerk.ai" :name "Danny McClanahan"))
;;    :changed (25648 23355 0)
;;    :date (25452 47459 0)
;;    :from ((:email "dmcc2@hypnicjerk.ai" :name "Danny McClanahan"))
;;    :message-id "58Og8cRPGcsMrHbqDlvF5-rJfl5Dyn6EURSMoQYXZzBYPRVGmKWyYeuWL7hNqeN6vAqwKfBWoh2Q6XeD05LvTkc84Wq__GWMFO7uuyXwl6w=@hypnicjerk.ai"
;;    :priority normal
;;    :references ("80KPngqtD010cpxdEabT2y2OpgpxfVUyIP7QTgSqjhozzjiMy1LcEGWFVHIGL8kZPFPOVAIf_TGpFIFlRO9-sr-yw9EBKQOw9t7mQEQMYZk=@hypnicjerk.ai" "MW4PR22MB3412448821CB0361529FF34FAF3B9@MW4PR22MB3412.namprd22.prod.outlook.com" "r0dgmUr2uEeWuqtgRa0-35PZ_QtHp46n9_k92cWxAyY2RJtoTGGSNO4hLWocrP3J95ZtI_cv6NSjeBzdN0yRL6sRMuMQgSfP7WVHZZ8gIgU=@hypnicjerk.ai" "MW4PR22MB34129DFE032FAA55BD55A6CCAF3C9@MW4PR22MB3412.namprd22.prod.outlook.com" "MW4PR22MB34125EC93EA1D1A767E990B8AF3F9@MW4PR22MB3412.namprd22.prod.outlook.com")
;;    :subject "Re: [redacted]"
;;    :to ((:email "redacted@example.com"))
;;    :maildir "/Sent"
;;    :flags (seen personal)
;;    :docid 553
;;    :meta (
;;      :path "177:fff:ffe:fff:z"
;;      :level 3
;;      :date "n636ea594"
;;      :data-tstamp (0 0 0)
;;      :first-child t
;;      :has-child t))
;;   face mu4e-header-face)

;;; non-thread:
;; (fontified t docid 2300 msg
;;  (:path "/home/cosmicexplorer/.mail/INBOX/cur/1680890582_9.30024.lightning-strike-teravolts,U=4,FMD5=7e33429f656f1e6e9d79b29c3f82c57e:2,S"
;;   :size 48602
;;   :reply-to ((:email "hello@tidelift.com"))
;;   :changed (25648 33892 0)
;;   :date (25646 54968 0)
;;   :from ((:email "hello@tidelift.com" :name "Tidelift"))
;;   :message-id "1680790556901.e21168e0-13af-4cd0-91fd-a18aa4cd9d7a@bf03.hubspotemail.net"
;;   :priority normal
;;   :subject "Who profits from open source maintainers' work? 🤔"
;;   :to ((:email "dmcc2@hypnicjerk.ai"))
;;   :maildir "/INBOX"
;;   :flags (seen personal)
;;   :docid 2300
;;   :meta (
;;     :path "14d:z"
;;     :level 0
;;     :date "n642ed6b8"
;;     :data-tstamp (0 0 0)
;;     :root t
;;     :thread-subject t))
;;  face mu4e-header-face)


;;; object-intervals output:
;; ((0 6 (fontified t msg
;;       (:path "/home/cosmicexplorer/.mail/INBOX/new/1680890658_11.30257.lightning-strike-teravolts,U=123,FMD5=7e33429f656f1e6e9d79b29c3f82c57e:2," :size 8081 :list-post ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com")) :reply-to ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com" :name "spack/spack")) :cc ((:email "algorithmicextremism@pm.me" :name "Danny McClanahan") (:email "review_requested@noreply.github.com" :name "Review requested")) :changed (25648 23330 0) :date (25574 47145 0) :from ((:email "notifications@github.com" :name "spackbot-app[bot]")) :list "spack.spack.github.com" :message-id "spack/spack/pull/35450/c1426370862@github.com" :priority low :references ("spack/spack/pull/35450@github.com") :subject "Re: [spack/spack] Make recipes consistent w.r. libintl, iconv, gettext (PR #35450)" :to ((:email "spack@noreply.github.com" :name "spack/spack")) :maildir "/INBOX" :flags (new unread list personal) :docid 2148 :meta (:path "14f:fff:z" :level 1 :date "n63e6b829" :data-tstamp (0 0 0) :first-child t :orphan t :thread-subject t))
;;       invisible t docid 2148))
;;  (6 8 (fontified t docid 2148 msg
;;       (:path "/home/cosmicexplorer/.mail/INBOX/new/1680890658_11.30257.lightning-strike-teravolts,U=123,FMD5=7e33429f656f1e6e9d79b29c3f82c57e:2," :size 8081 :list-post ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com")) :reply-to ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com" :name "spack/spack")) :cc ((:email "algorithmicextremism@pm.me" :name "Danny McClanahan") (:email "review_requested@noreply.github.com" :name "Review requested")) :changed (25648 23330 0) :date (25574 47145 0) :from ((:email "notifications@github.com" :name "spackbot-app[bot]")) :list "spack.spack.github.com" :message-id "spack/spack/pull/35450/c1426370862@github.com" :priority low :references ("spack/spack/pull/35450@github.com") :subject "Re: [spack/spack] Make recipes consistent w.r. libintl, iconv, gettext (PR #35450)" :to ((:email "spack@noreply.github.com" :name "spack/spack")) :maildir "/INBOX" :flags (new unread list personal) :docid 2148 :meta (:path "14f:fff:z" :level 1 :date "n63e6b829" :data-tstamp (0 0 0) :first-child t :orphan t :thread-subject t))))
;;  (8 18 (fontified t docid 2148 msg
;;        (:path "/home/cosmicexplorer/.mail/INBOX/new/1680890658_11.30257.lightning-strike-teravolts,U=123,FMD5=7e33429f656f1e6e9d79b29c3f82c57e:2," :size 8081 :list-post ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com")) :reply-to ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com" :name "spack/spack")) :cc ((:email "algorithmicextremism@pm.me" :name "Danny McClanahan") (:email "review_requested@noreply.github.com" :name "Review requested")) :changed (25648 23330 0) :date (25574 47145 0) :from ((:email "notifications@github.com" :name "spackbot-app[bot]")) :list "spack.spack.github.com" :message-id "spack/spack/pull/35450/c1426370862@github.com" :priority low :references ("spack/spack/pull/35450@github.com") :subject "Re: [spack/spack] Make recipes consistent w.r. libintl, iconv, gettext (PR #35450)" :to ((:email "spack@noreply.github.com" :name "spack/spack")) :maildir "/INBOX" :flags (new unread list personal) :docid 2148 :meta (:path "14f:fff:z" :level 1 :date "n63e6b829" :data-tstamp (0 0 0) :first-child t :orphan t :thread-subject t))
;;        face mu4e-column-faces-date help-echo "Fri 10 Feb 2023 04:33:29 PM EST"))
;;  (18 20 (fontified t docid 2148 msg
;;         (:path "/home/cosmicexplorer/.mail/INBOX/new/1680890658_11.30257.lightning-strike-teravolts,U=123,FMD5=7e33429f656f1e6e9d79b29c3f82c57e:2," :size 8081 :list-post ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com")) :reply-to ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com" :name "spack/spack")) :cc ((:email "algorithmicextremism@pm.me" :name "Danny McClanahan") (:email "review_requested@noreply.github.com" :name "Review requested")) :changed (25648 23330 0) :date (25574 47145 0) :from ((:email "notifications@github.com" :name "spackbot-app[bot]")) :list "spack.spack.github.com" :message-id "spack/spack/pull/35450/c1426370862@github.com" :priority low :references ("spack/spack/pull/35450@github.com") :subject "Re: [spack/spack] Make recipes consistent w.r. libintl, iconv, gettext (PR #35450)" :to ((:email "spack@noreply.github.com" :name "spack/spack")) :maildir "/INBOX" :flags (new unread list personal) :docid 2148 :meta (:path "14f:fff:z" :level 1 :date "n63e6b829" :data-tstamp (0 0 0) :first-child t :orphan t :thread-subject t))
;;         face mu4e-column-faces-date))
;;  (20 21 (fontified t docid 2148 msg
;;         (:path "/home/cosmicexplorer/.mail/INBOX/new/1680890658_11.30257.lightning-strike-teravolts,U=123,FMD5=7e33429f656f1e6e9d79b29c3f82c57e:2," :size 8081 :list-post ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com")) :reply-to ((:email "reply+AAJ6UTYQOLLH47OX5P56WMGB6PVKTEVBNHHF4MTQLE@reply.github.com" :name "spack/spack")) :cc ((:email "algorithmicextremism@pm.me" :name "Danny McClanahan") (:email "review_requested@noreply.github.com" :name "Review requested")) :changed (25648 23330 0) :date (25574 47145 0) :from ((:email "notifications@github.com" :name "spackbot-app[bot]")) :list "spack.spack.github.com" :message-id "spack/spack/pull/35450/c1426370862@github.com" :priority low :references ("spack/spack/pull/35450@github.com") :subject "Re: [spack/spack] Make recipes consistent w.r. libintl, iconv, gettext (PR #35450)" :to ((:email "spack@noreply.github.com" :name "spack/spack")) :maildir "/INBOX" :flags (new unread list personal) :docid 2148 :meta (:path "14f:fff:z" :level 1 :date "n63e6b829" :data-tstamp (0 0 0) :first-child t :orphan t :thread-subject t)))))





(provide 'mu4me)
;;; mu4me.el ends here
