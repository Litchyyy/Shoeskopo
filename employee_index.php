<?php
require_once __DIR__ . '/config/db.php'; require_once __DIR__ . '/includes/functions.php'; require_role(['employee']); http_response_code(403); exit('Employee dashboard is not enabled for this admin-only management system.');
