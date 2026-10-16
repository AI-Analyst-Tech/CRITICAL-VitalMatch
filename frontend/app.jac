"""CRITICAL web application interface."""

def:pub app() -> JsxElement {
    return (
        <div>
            <header>
                <div>
                    <strong>CRITICAL</strong>
                    <span>Intelligent Blood Donor Mobilization</span>
                </div>

                <nav>
                    <a href="#how-it-works">How It Works</a>
                    <a href="#donors">Become a Donor</a>
                    <a href="#request">Request Blood</a>
                </nav>
            </header>

            <main>
                <section>
                    <p>INTELLIGENT BLOOD DONOR MOBILIZATION</p>

                    <h1>
                        Right donor. Right time. Every life matters.
                    </h1>

                    <p>
                        CRITICAL transforms urgent blood appeals into an
                        intelligent, consent-aware and auditable donor
                        mobilization workflow.
                    </p>

                    <div>
                        <button>Request Blood</button>
                        <button>Become a Donor</button>
                    </div>
                </section>

                <section id="how-it-works">
                    <h2>How CRITICAL works</h2>

                    <div>
                        <article>
                            <h3>01. Receive</h3>
                            <p>
                                Capture an urgent blood request with the
                                information needed for mobilization.
                            </p>
                        </article>

                        <article>
                            <h3>02. Match</h3>
                            <p>
                                Identify suitable available donors using
                                deterministic matching rules.
                            </p>
                        </article>

                        <article>
                            <h3>03. Mobilize</h3>
                            <p>
                                Coordinate verified donors through
                                consent-aware notifications.
                            </p>
                        </article>

                        <article>
                            <h3>04. Respond</h3>
                            <p>
                                Track donor responses and the progress of
                                the emergency request.
                            </p>
                        </article>
                    </div>
                </section>

                <section id="donors">
                    <h2>For donors</h2>
                    <p>
                        Make your availability visible when you are willing
                        and able to help.
                    </p>
                </section>

                <section id="request">
                    <h2>Need blood urgently?</h2>
                    <p>
                        Create a structured request so the right donors can
                        be identified quickly.
                    </p>
                </section>
            </main>

            <footer>
                <strong>CRITICAL</strong>
                <p>
                    Right donor. Right time. Every life matters.
                </p>
            </footer>
        </div>
    );
}
