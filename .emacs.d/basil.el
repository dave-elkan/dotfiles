;; Vendor directory contains adhoc scripts
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list 'exec-path "/usr/local/bin")

;; Shows a minimap of the current buffer
(require 'minimap)

;; Viper and Vimpulse
(setq viper-mode t)				   ; enable Viper at load time
(setq viper-ex-style-editing nil)  ; can backspace past start of insert / line
(require 'viper)				   ; load Viper
(require 'vimpulse)				   ; load Vimpulse
(setq woman-use-own-frame nil)	   ; don't create new frame for manpages
(setq woman-use-topic-at-point t)  ; don't prompt upon K key (manpage display)
;(setq vimpulse-experimental nil)	 ; don't load bleeding edge code (see 6. installation instruction)

;; Further recommended Vim emulation scripts to aid in redo and visual block selection
(require 'redo)
(require 'rect-mark)

;; Turn on tabs
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)

;; Bind the TAB key 
(global-set-key (kbd "TAB") 'self-insert-command)

;; Set the tab width
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-indent 4)

;; Display line numbers in margin
(global-linum-mode 1)

;; Font
(defun fontify-frame (frame)
	(set-frame-parameter frame 'font "Monaco-14"))
;; Fontify current frame
(fontify-frame nil)
;; Fontify any future frames
(push 'fontify-frame after-make-frame-functions)

;; Set frame size
(defun set-frame-size-according-to-resolution ()
	(interactive)
	(if window-system
	(progn
		;; use 245 char wide window for largeish displays
		;; and smaller 80 column windows for smaller displays
		(if (> (x-display-pixel-width) 1280)
			(add-to-list 'default-frame-alist (cons 'width 245))
			(add-to-list 'default-frame-alist (cons 'width 80)))
		;; for the height, subtract a couple hundred pixels
		;; from the screen height (for panels, menubars and
		;; whatnot), then divide by the height of a char to
		;; get the height we want
		(add-to-list 'default-frame-alist 
			(cons 'height (/ (- (x-display-pixel-height) 200) (frame-char-height)))))))

(set-frame-size-according-to-resolution)

;; Idle highlight
(require 'idle-highlight)
(defun my-coding-hook ()
	(make-local-variable 'column-number-mode)
	(column-number-mode t)
	(if window-system (hl-line-mode t))
	(idle-highlight))

(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
(add-hook 'objc-mode-hook 'my-coding-hook)

;; VCS
(require 'magit)
(require 'eshell-vc)

;; Don't open a new frame when a new file is opened externally
(setq ns-pop-up-frames 'nil)

;; Ido mode for fast file and buffer searching
(require 'ido)
(ido-mode t)

;; Show matching parantheses
(show-paren-mode t)

;; Autoindent
(define-key global-map (kbd "RET") 'newline-and-indent)
(add-hook 'objc-mode-hook
	(lambda ()
		(c-set-style "k&r")
		(setq c-basic-offset 4)))

;; Autoindent pasted lines
(dolist (command '(yank yank-pop))
	(eval `(defadvice ,command (after indent-region activate)
		(and (not current-prefix-arg)
			(member major-mode '(emacs-lisp-mode lisp-mode
									clojure-mode    scheme-mode
									haskell-mode    ruby-mode
									rspec-mode      python-mode
									c-mode          c++-mode
									objc-mode       latex-mode
									plain-tex-mode))
			(let ((mark-even-if-inactive transient-mark-mode))
				(indent-region (region-beginning) (region-end) nil))))))

;; Compile command for Xcode
(setq compile-command "xcodebuild")

;; Colour theme
(add-to-list 'load-path (concat dotfiles-dir "/vendor/themes"))
(require 'color-theme)
(color-theme-initialize)
(color-theme-wombat)

;; Anything - Quicksilver for Emacs
(require 'anything-config)

;; Org
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Visual line mode and FlySpell for Org-Mode
(setq ispell-program-name "aspell")
(add-hook 'org-mode-hook
	(lambda()
		(visual-line-mode 1)
		(flyspell-mode 1)))
