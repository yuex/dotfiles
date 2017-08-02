(package-initialize)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(unless (package-installed-p 'diminish)
  (package-install 'diminish))

;; set backup folder
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq backup-by-copying t   ; don't clobber symlinks
      version-control t     ; use versioned backups
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2)

;; Set default font
(set-frame-font "Inconsolata-g for Powerline-11")

(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

(use-package auto-package-update
  :config
  (auto-package-update-maybe)
  (add-hook 'auto-package-update-before-hook
            (lambda () (message "I will update packages now")))
  )

(use-package benchmark-init
  :config
  (benchmark-init/activate))

(use-package keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode))

(use-package solarized-theme
  :config
  (load-theme 'solarized-dark t))

(use-package powerline
  :config
  (powerline-default-theme)
  (setq powerline-utf-8-separator-left  #x2b80
        powerline-utf-8-separator-right #x2b82)
  )

(use-package airline-themes
  :config
  (setq airline-display-directory nil)
  (load-theme 'airline-powerlineish t))

(use-package rainbow-mode
  :diminish rainbow-mode)

(use-package rainbow-delimiters)

(use-package smartparens
  :config
  (require 'smartparens-config))

(use-package git-gutter
  :diminish git-gutter-mode
  :config

  (global-git-gutter-mode t)

  (defun linum-format-func (line)
    (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
      (propertize (format (format " %%%dd " w) line) 'face 'linum)))
  (setq linum-format 'linum-format-func)
  )

(use-package indent-guide
  :diminish (indent-guide-global-mode
             indent-guide-mode)
  :config
  ;; (indent-guide-global-mode t)
  (setq indent-guide-recursive t)
  (setq indent-guide-char "|")
  )

(use-package clean-aindent-mode)

(use-package fill-column-indicator)

(use-package expand-region
  :config
  (bind-key "C-c =" 'er/expand-region))

(use-package zzz-to-char
  :config
  (global-set-key (kbd "M-z") #'zzz-to-char))

(use-package pangu-spacing
  :diminish pangu-spacing-mode
  :config
  (pangu-spacing-mode t))

(use-package vlf)

(use-package ivy)

(use-package swiper
  :config
  (bind-key (kbd "C-s") 'swiper))

(use-package avy
  :config
  ;; (setq avy-highlight-first nil)
  (setq avy-case-fold-search nil)
  ;; (setq avy-keys (append (number-sequence ?a ?z)
  ;;                        (number-sequence ?A ?Z)))
  )

(use-package ace-window
  :config
  (set-face-attribute 'aw-leading-char-face nil
                      :foreground "deep sky blue"
                      :weight 'bold
                      :height 16.0)
  (set-face-attribute 'aw-mode-line-face nil
                      :inherit 'mode-line-buffer-id
                      :foreground "lawn green")
  )

(use-package ido-hacks)

(use-package ido-completing-read+)

(use-package ido-vertical-mode)

(use-package ido-sort-mtime
  :diminish ido-sort-mtime-mode)

(use-package ido-yes-or-no)

(use-package flx-ido)

(use-package smex)

(use-package find-file-in-project)

(use-package imenu-anywhere)

(use-package ido
  :config

  (ido-mode t)

  (ido-everywhere t)
  (ido-ubiquitous-mode t)

  (ido-yes-or-no-mode t)

  (ido-vertical-mode t)
  (setq ido-vertical-show-count t)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)

  (ido-sort-mtime-mode t)

  (flx-ido-mode t)
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil)

  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c M-x") 'execute-extended-command)

  (setq ffip-find-options "-not -path '*/\.*'")
  (setq ffip-prefer-ido-mode t)
  )

(use-package helm)

(use-package auto-complete
  :diminish auto-complete-mode
  :config
  (ac-config-default)

  ;; disable fci-mode, when popup activate
  (defvar sanityinc/fci-mode-suppressed nil)
  (defadvice popup-create (before suppress-fci-mode activate)
    "Suspend fci-mode while popups are visible"
    (set (make-local-variable 'sanityinc/fci-mode-suppressed) fci-mode)
    (when fci-mode
      (turn-off-fci-mode)))
  (defadvice popup-delete (after restore-fci-mode activate)
    "Restore fci-mode when all popups have closed"
    (when (and (not popup-instances) sanityinc/fci-mode-suppressed)
      (setq sanityinc/fci-mode-suppressed nil)
      (turn-on-fci-mode)))
  )

(use-package aggressive-indent
  :diminish aggressive-indent-mode)

(use-package flycheck)

(use-package insert-shebang)

; (use-package jedi)

; (use-package flycheck-pyflakes)

(use-package haskell-mode)

(use-package sml-mode)

(use-package hindent
  :diminish hindent-mode)

(use-package go-mode)

;; (use-package go-flycheck)

(use-package go-autocomplete)

(use-package flycheck-bashate
  :config
  (flycheck-bashate-setup))

(use-package yaml-mode)

(use-package markdown-mode)

(use-package evil-visual-mark-mode
  :config
  (evil-visual-mark-mode t))

(use-package evil-visualstar)

(use-package evil-numbers)

(use-package evil-escape
  :diminish evil-escape-mode
  :config
  (evil-escape-mode t)
  (bind-key* (kbd "C-q") 'evil-escape))

(use-package evil-matchit
  :config
  (global-evil-matchit-mode t))

(use-package evil-surround
  :config
  (global-evil-surround-mode t))

(use-package evil-exchange)

(use-package evil-nerd-commenter)

(use-package evil-leader
  :config

  (global-evil-leader-mode t)
  (evil-leader/set-leader ";")

  (defvar yuex/linum-mode-enabled nil)
  (defun toggle-linum-gitgutter ()
    (interactive)
    (cond
     (yuex/linum-mode-enabled
      (call-interactively 'linum-mode nil)
      (call-interactively 'git-gutter-mode t)
      (setq yuex/linum-mode-enabled nil))
     (t
      (call-interactively 'linum-mode t)
      (call-interactively 'git-gutter-mode nil)
      (setq yuex/linum-mode-enabled t))))

  (defun selective-display-increase ()
    (interactive)
    (set-selective-display
     (if selective-display
         (+ selective-display evil-shift-width)
       evil-shift-width)))

  (defun selective-display-decrease ()
    (interactive)
    (when selective-display
      (set-selective-display
       (if (< (- selective-display evil-shift-width) evil-shift-width)
           evil-shift-width
         (- selective-display evil-shift-width)))))

  (defun selective-display-all ()
    (interactive)
    (set-selective-display nil))

  (defun selective-display-none ()
    (interactive)
    (set-selective-display evil-shift-width))

  (defun selective-display-toggle ()
    (interactive)
    (if selective-display
        (call-interactively 'selective-display-all)
      (call-interactively 'selective-display-none)))

  (defun indent-buffer-or-region ()
    (interactive)
    (save-excursion
      (if (use-region-p)
          (indent-region (region-beginning) (region-end) nil)
        (indent-region (point-min) (point-max) nil))))

  (defun ws-clean-buffer-or-region ()
    (interactive)
    (save-excursion
      (if (use-region-p)
          (progn
            (untabify (region-beginning) (region-end))
            (whitespace-cleanup-region (region-beginning) (region-end)))
        (progn
          (untabify (point-min) (point-max))
          (whitespace-cleanup)))))

  (evil-leader/set-key
    ;; poorman's folding
    "za" 'selective-display-toggle

    "zr" 'selective-display-increase
    "zo" 'selective-display-increase
    "zm" 'selective-display-decrease
    "zc" 'selective-display-decrease

    "zR" 'selective-display-all
    "zO" 'selective-display-all
    "zM" 'selective-display-none
    "zC" 'selective-display-none

    ;; toggle modes
    "til" 'indent-guide-mode
    "tii" 'fci-mode
    "tai" 'aggressive-indent-mode
    "tac" 'auto-complete-mode
    "tec" 'evil-escape-mode
    "tws" 'global-whitespace-mode
    "tgg" 'global-git-gutter-mode
    "tfc" 'flycheck-mode
    "tsh" 'shell-script-mode
    "twk" 'which-key-mode
    "trr" 'rainbow-mode
    "tcjk" 'pangu-spacing-mode

    ;; quick toggle troublesome plugins
    "ll" 'toggle-linum-gitgutter

    ;; imenu quick fire
    "ii" 'imenu-anywhere

    ; "ii" 'fci-mode
    ; "il" 'indent-guide-mode

    ;; flycheck
    "fl" 'flycheck-list-errors

    ;; style
    "fs" 'ws-clean-buffer-or-region
    "fi" 'indent-buffer-or-region
    "ff" (defun ws-indent-buffer-or-region ()
           (interactive)
           (ws-clean-buffer-or-region)
           (indent-buffer-or-region))

    ;; number +/-
    "na" 'evil-numbers/inc-at-pt
    "ns" 'evil-numbers/dec-at-pt

    ;; evil-exchange
    "xx" 'evil-exchange
    "xc" 'evil-exchange-cancel

    ;; nerd commenter
    "cc" 'evilnc-comment-or-uncomment-lines
    "cu" 'evilnc-comment-or-uncomment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cv" 'comment-or-uncomment-region
    "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
    "cy" 'evilnc-copy-and-comment-lines
    "ci" 'evilnc-toggle-invert-comment-line-by-line
    "ce" 'evilnc-toggle-comment-empty-line
    "\\" 'evilnc-comment-operator ; if you prefer backslash key
    )

  (bind-key (kbd "C-c f f") 'find-file-in-project)
  )

(use-package evil
  :diminish (auto-fill-function
             global-whitespace-mode
             white-space-mode
             undo-tree-mode)
  :config

  (evil-mode t)
  (global-hl-line-mode t)

  ;; set word wrap
  (setq-default word-wrap t)
  (setq-default fill-column 80)
  (add-hook 'prog-mode-hook #'auto-fill-mode)
  (add-hook 'text-mode-hook #'auto-fill-mode)

  ;; scroll
  ; (scroll-bar-mode -1)
  (setq scroll-step 1)
  (setq scroll-margin 2)

  ;; set rule column
  (setq fci-rule-column 80)
  (add-hook 'prog-mode-hook #'fci-mode)
  (add-hook 'text-mode-hook #'fci-mode)

  ;; set paren pair
  (show-paren-mode t)
  (setq show-paren-style 'expression)
  (setq show-paren-dely 0)
  (smartparens-global-mode t)
  ;; (add-hook 'prog-mode-hook #'smartparens-mode)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'text-mode-hook #'rainbow-delimiters-mode)

  ;; show tabs and trailing space
  (setq-default tab-width 4)
  (setq-default indent-tabs-mode nil)
  (clean-aindent-mode t)
  (global-whitespace-mode t)
  (setq whitespace-style '(face trailing tabs lines-tail))

  ;; highlight fixme
  (defun highlight-fixme ()
    (font-lock-add-keywords
     nil
     '(("\\<\\(FIXME\\|TODO\\|BUG\\|XXX\\):" 1 font-lock-warning-face t))))
  (add-hook 'prog-mode-hook #'highlight-fixme)

  ;;                                                    __
  ;;     ____  _________  ____ _   ____ ___  ____  ____/ /__
  ;;    / __ \/ ___/ __ \/ __ `/  / __ `__ \/ __ \/ __  / _ \
  ;;   / /_/ / /  / /_/ / /_/ /  / / / / / / /_/ / /_/ /  __/
  ;;  / .___/_/   \____/\__, /  /_/ /_/ /_/\____/\__,_/\___/
  ;; /_/               /____/
  ;;
  (defun config-prog-mode ()
    (cond
     ;; cc mode
     ((eq major-mode 'c-mode)
      (c-set-style "cc-mode")
      (global-set-key (kbd "C-x a a") 'ff-find-other-file)
      )
     ;; python mode
     ((eq major-mode 'python-mode)
      ; (jedi:setup)
      (outline-minor-mode t))

     ;; haskell mode
     ((eq major-mode 'haskell-mode)
      (hindent-mode t)
      (outline-minor-mode t)

      (set
       (make-local-variable 'outline-regexp)
       (rx
        (* anything)
        (or "do" "mdo" "where")
        symbol-end))
      (set
       (make-local-variable 'outline-level)
       (defun haskell-outline-level ()
         (let (buffer-invisibility-spec)
           (save-excursion
             (skip-chars-forward "    \n")
             (current-column))))))

     ;; yaml mode
     ((eq major-mode 'yaml-mode)
      (setq evil-shift-width yaml-indent-offset)
      (setq tab-width yaml-indent-offset)
      ;; (setq indent-line-function 'indent-relative)
      )

     ;; default mode
     (t
      (hs-minor-mode t)
      ; (aggressive-indent-mode t)
      (cond
       ((eq major-mode 'go-mode)
        (add-hook 'before-save-hook #'gofmt-before-save))
       ((eq major-mode 'emacs-lisp-mode)
        (eldoc-mode t))
       ))
     ))
  (add-hook 'prog-mode-hook 'config-prog-mode)
  (add-hook 'text-mode-hook 'config-prog-mode)

  ;; ibuffer
  (global-set-key (kbd "C-x C-b") 'ibuffer)

  ;; find-file-in-project
  (global-set-key (kbd "C-x C-g") 'find-file-in-project)

  ;; imenu-anywhere (cross buffers)
  (global-set-key (kbd "C-x M-i") 'imenu-anywhere)

  ;; nil leader key
  (define-key evil-normal-state-map (kbd ";") nil)

  ;; repeat
  (define-key evil-normal-state-map (kbd "; ;") 'evil-repeat)
  (define-key evil-normal-state-map (kbd "M-;") 'evil-repeat)

  ;; repeat char
  (define-key evil-normal-state-map (kbd ".") 'evil-repeat-find-char)
  (define-key evil-normal-state-map (kbd ",") 'evil-repeat-find-char-reverse)
  (define-key evil-motion-state-map (kbd ".") 'evil-repeat-find-char)
  (define-key evil-motion-state-map (kbd ",") 'evil-repeat-find-char-reverse)

  ;; home/end
  (define-key evil-motion-state-map (kbd "C-a") 'evil-first-non-blank)
  (define-key evil-motion-state-map (kbd "C-e") 'end-of-line)
  (define-key evil-insert-state-map (kbd "C-a") 'evil-first-non-blank)
  (define-key evil-insert-state-map (kbd "C-e") 'end-of-line)

  ;; insert previous/next line
  (define-key evil-insert-state-map (kbd "C-p") 'evil-previous-line)
  (define-key evil-insert-state-map (kbd "C-n") 'evil-next-line)

  ;; readlineish kill line
  (define-key evil-insert-state-map (kbd "C-y") 'yank)
  (define-key evil-insert-state-map (kbd "C-k") 'kill-line)
  (define-key evil-insert-state-map (kbd "C-u")
    (defun kill-line-backward (arg)
      (interactive "p")
      (kill-line (- 1 arg))))

  ;; join/break lines
  (define-key evil-normal-state-map (kbd "M-j") 'delete-indentation)
  ;; (define-key evil-normal-state-map (kbd "o") (kbd "$ a RET <escape>"))
  (define-key evil-normal-state-map (kbd "K") (kbd "i RET <escape>"))

  ;; windows
  (define-key evil-motion-state-map (kbd "C-w ;") 'ace-window)
  (define-key evil-normal-state-map (kbd "C-w |") 'evil-window-vsplit)
  (define-key evil-normal-state-map (kbd "C-w _") 'evil-window-split)
  (define-key evil-normal-state-map (kbd "C-w 1") 'delete-other-windows)

  (define-key evil-normal-state-map (kbd "C-w C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w C-l") 'evil-window-right)
  (define-key evil-normal-state-map (kbd "C-w C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w C-k") 'evil-window-up)

  (define-key evil-normal-state-map (kbd "C-w o") 'evil-window-prev)
  (define-key evil-normal-state-map (kbd "C-w w") 'evil-window-next)
  (define-key evil-normal-state-map (kbd "C-w C-o") 'evil-window-prev)
  (define-key evil-normal-state-map (kbd "C-w C-w") 'evil-window-next)

  (define-key evil-normal-state-map (kbd "C-w p") 'evil-window-prev)
  (define-key evil-normal-state-map (kbd "C-w n") 'evil-window-next)
  (define-key evil-normal-state-map (kbd "C-w C-p") 'evil-window-prev)
  (define-key evil-normal-state-map (kbd "C-w C-n") 'evil-window-next)

  ;; shift
  (define-key evil-normal-state-map (kbd "M-,") 'evil-shift-left-line)
  (define-key evil-normal-state-map (kbd "M-.") 'evil-shift-right-line)
  (define-key evil-insert-state-map (kbd "M-,") 'evil-shift-left-line)
  (define-key evil-insert-state-map (kbd "M-.") 'evil-shift-right-line)
  (define-key evil-visual-state-map (kbd "M-,")
    (defun visual-shift-and-restore-left ()
      (interactive)
      (evil-shift-left (region-beginning) (region-end))
      (evil-normal-state)
      (evil-visual-restore)
      ))
  (define-key evil-visual-state-map (kbd "M-.")
    (defun visual-shift-and-restore-right ()
      (interactive)
      (evil-shift-right (region-beginning) (region-end))
      (evil-normal-state)
      (evil-visual-restore)
      ))

  ;; indent, mode-nostic
  (define-key evil-insert-state-map (kbd "TAB") 'indent-for-tab-command)
  (define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)
  (define-key evil-visual-state-map (kbd "TAB")
    (defun visual-indent-and-restore ()
      ;; not working
      (interactive)
      (indent-for-tab-command)
      (evil-normal-state)
      (evil-visual-restore)
      ))

  ;; expand region
  (define-key evil-normal-state-map (kbd "+") 'er/expand-region)
  (define-key evil-normal-state-map (kbd "_") 'er/contract-region)
  (define-key evil-visual-state-map (kbd "+") 'er/expand-region)
  (define-key evil-visual-state-map (kbd "_") 'er/contract-region)
  (global-evil-visualstar-mode)

  ;; imenu
  (global-set-key (kbd "M-i") 'imenu)

  ;; avy jump
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (mapc
   (defun bind-key-to-avy-cmd (arg)
     (let* ((key (car arg))
            (cmd (cdr arg))
            (evil-key (concat "SPC " key))
            (emac-key (concat "C-c SPC " key)))
       (define-key evil-motion-state-map (kbd evil-key) cmd)
       (define-key evil-operator-state-map (kbd evil-key) cmd)
       (global-set-key (kbd emac-key) cmd)
       ))
   '(
     ("SPC" . avy-goto-char-2)
     ("f"   . avy-goto-char-in-line)
     ("s"   . avy-goto-char)
     ("w"   . avy-goto-subword-1)
     ("e"   . avy-goto-subword-0)

     ("j"   . avy-goto-line-below)
     ("k"   . avy-goto-line-above)
     ("p"   . avy-isearch)
     ("n"   . avy-isearch)
     ("y"   . avy-copy-region)
     ("m"   . avy-move-region)
     ("d"   . avy-kill-region)
     ))
  )
