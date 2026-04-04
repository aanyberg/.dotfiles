# Global Claude Code Configuration

This file is loaded automatically in every project. It defines the available
subagents and the delegation rules that govern how work is distributed between
them.

---

## Subagents

| Agent         | Language          | Responsibility         | Definition                          |
|---------------|-------------------|------------------------|-------------------------------------|
| `py-executor` | Python            | Implementation only    | `~/.claude/agents/py-executor.md`   |
| `py-tester`   | Python            | Testing only           | `~/.claude/agents/py-tester.md`     |
| `rn-executor` | TypeScript / JS   | Implementation only    | `~/.claude/agents/rn-executor.md`   |
| `rn-tester`   | TypeScript / JS   | Testing only           | `~/.claude/agents/rn-tester.md`     |

---

## Delegation Rules

### Python Projects

- All Python implementation work (modules, classes, services, utilities) is
  delegated to `py-executor`.
- `py-executor` **never** writes test files. On completion it delegates
  affected files to `py-tester`.
- All pytest suite work is delegated to `py-tester`.
- `py-tester` **never** modifies implementation files. It reports bugs and
  suggested fixes back to `py-executor`.

### React Native / Expo Projects

- All TypeScript/JavaScript implementation work (components, hooks, screens,
  services) is delegated to `rn-executor`.
- `rn-executor` **never** writes test files. On completion it delegates
  affected files to `rn-tester`.
- All Jest/RNTL suite work is delegated to `rn-tester`.
- `rn-tester` **never** modifies implementation files. It reports bugs and
  suggested fixes back to `rn-executor`.

### Bug Fix Loop

```
executor  →  implements  →  delegates to tester
tester    →  tests       →  reports bugs to executor
executor  →  fixes       →  re-delegates to tester
```

This loop repeats until `tester` reports a clean run.

---

## Branching & Version Control

- **Always branch from `main`.** Never commit implementation directly to `main`
  or `develop`.
- **Branch names follow Conventional Commits format:**
  `<type>/<short-kebab-description>`
  Valid types: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`, `perf`, `ci`
  Example: `feat/user-authentication`, `fix/token-refresh-crash`
- **One logical change per branch.** Do not bundle unrelated changes.
- **Commit messages follow Conventional Commits:**
  `<type>(<optional scope>): <imperative description>`
  Example: `feat(auth): add JWT refresh token rotation`
- **No "WIP" or "misc" commits on shared branches.** Squash or amend before
  any merge.


## Task Planning

- **Planned tasks live in `.claude/planning/tasks/`.** A planned task is work
  that has been defined but not yet started. Planning does not imply immediate
  execution.
- **When asked to plan a task**, create a file named:
  `<type>_<short-description>.md`
  Example: `.claude/planning/tasks/feat_user-authentication.md`
- **Planned task files use this structure:**
```markdown
  # <Task Title>

  **Status:** planned
  **Created:** <datetime>

  ## Goal
  One paragraph. What is being built and why.

  ## Acceptance Criteria
  - [ ] Criterion one
  - [ ] Criterion two

  ## Plan
  Ordered steps the agent intends to take before touching any code.

  ## Blockers
  Any open questions or decisions that need human input before this task
  can be started.
```

- **Do not create a branch, write code, or create a task file** for a planned
  task. Planning is definition only.
- **Blockers in a planned task are pre-start blockers.** They must be resolved
  before the task can be promoted to active.


## Task Tracking

- **Active tasks live in `.claude/tasks/`.** A task becomes active the moment
  work begins.
- **To start a planned task:** move its file from `.claude/planning/tasks/`
  to `.claude/tasks/`, update **Status** to `active`, add a **Started**
  datetime, and add the **Branch** field before writing any code.
- **To create a new unplanned task** (work that was never in planning): create
  the file directly in `.claude/tasks/` with **Status** set to `active`.
- Task files in `.claude/tasks/` use this exact structure:
```markdown
  # 

  **Status:** active
  **Created:** 
  **Started:** 

  ## Branch
  `/short-description`

  ## Goal
  One paragraph. What is being built and why.

  ## Acceptance Criteria
  - [ ] Criterion one
  - [ ] Criterion two

  ## Plan
  Ordered steps the agent intends to take before touching any code.

  ## Log
  - `HH:MM` — What was done (not what will be done)

  ## Blockers
  Any open questions or decisions that need human input.
```

- **The Plan section must be written before any code is written.** If the plan
  changes mid-task, update it and log why.
- **Acceptance Criteria must all be checked before the task is considered
  done.**


## Merge Readiness

- A branch is not merge-ready until:
  - [ ] All Acceptance Criteria in the task file are checked
  - [ ] All new code has corresponding tests
  - [ ] No linting errors or type errors
  - [ ] Pre-commit runs without errors.
  - [ ] `CHANGELOG.md` updated if the change affects public behaviour
  - [ ] Version bumped in `pyproject.toml` / `package.json` if applicable
- The agent must append a **Summary** section to the task file before
  declaring the task done, describing what was built and any deviations from
  the original plan.


## Agent Discipline

- **No implementation without a task file.** If no task file exists for the
  current work, create one before writing any code.
- **No branch creation without a task file.** The branch name must match the
  task file's `<type>` and `<short-description>`.
- **Pause and surface blockers, don't guess.** If a decision affects
  architecture, public API, or data schema — stop and add it to the Blockers
  section. Do not infer and proceed.
- **Scope is frozen once the Plan is written.** Any scope change requires
  updating the Plan, logging the reason, and (if significant) human
  confirmation before continuing.
- **Do not modify files outside the task's stated scope** without logging it
  explicitly and stating why it was necessary.


## General Rules (All Agents)

- **Imports at module level only.** Never inside functions, conditionals, or
  class bodies — regardless of language.
- **No implementation code in test files. No test code in implementation
  files.** The boundary is strict.
- **Versioning is Semantic Versioning** (`MAJOR.MINOR.PATCH`) in all projects.
  Version is the single source of truth in `pyproject.toml` (Python) or
  `package.json` (React Native).
- **Style guides are non-negotiable.** Python follows the Google Python Style
  Guide. TypeScript follows the Google TypeScript Style Guide.
