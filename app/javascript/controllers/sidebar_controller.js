import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel", "backdrop"]

  initialize() {
    const saved = sessionStorage.getItem("sidebar:open")
    const isDesktop = window.matchMedia("(min-width: 1024px)").matches
    this.open = saved !== null ? saved === "true" : isDesktop
  }

  connect() {
    if (this.hasPanelTarget) this.apply() // 初回同期

    // Turbo遷移のたびに同期(permanent要素でもフックで確実に走らせる)
    this._onTurboLoad = () => { if (this.hasPanelTarget) this.apply() }
    this._onBeforeRender = () => { if (this.hasPanelTarget) this.apply() }
    this._onBeforeCache = () => { if (this.hasPanelTarget) this.apply() }

    addEventListener("turbo:load", this._onTurboLoad)
    addEventListener("turbo:before-render", this._onBeforeRender)
    addEventListener("turbo:before-cache", this._onBeforeCache)
  }

  disconnect() {
    removeEventListener("turbo:load", this._onTurboLoad)
    removeEventListener("turbo:before-render", this._onBeforeRender)
    removeEventListener("turbo:before-cache", this._onBeforeCache)
  }

  toggle() { if (!this.hasPanelTarget) return; this.open = !this.open; this.persist(); this.apply() }
  close()  { if (!this.hasPanelTarget) return; this.open = false;      this.persist(); this.apply() }

  // モバイル時のみ、リンククリック直後に閉じる
  closeOnNavigate(event) {
    if (!this.hasPanelTarget) return
    const isTabletUp = window.matchMedia("(min-width: 768px)").matches
    if (isTabletUp) return // md以上はサイドバー自体が無いので何もしない
    // ここでは preventDefault しない Turbo の遷移はそのまま進める
    this.close()
  }

  apply() {
    // open 状態と DOM クラスを同期(遷移直後にも必ず走る)
    this.panelTarget.classList.toggle("-translate-x-full", !this.open)
    this.panelTarget.classList.toggle("translate-x-0", this.open)

    const isDesktop = window.matchMedia("(min-width: 1024px)").matches
    if (this.hasBackdropTarget) {
      this.backdropTarget.classList.toggle("hidden", isDesktop || !this.open)
    }
  }

  persist() { sessionStorage.setItem("sidebar:open", String(this.open)) }
}
