CREATE TABLE IF NOT EXISTS starboard (
    id           BIGINT     PRIMARY KEY,                        -- server id (pk)
    channel      BIGINT     DEFAULT -1 NOT NULL,                -- channel ID where the starboard messages will be sent to
    threshold    INT        DEFAULT 13 NOT NULL,                -- minimum stars needed to display a message onto the starboard
    locked       BOOLEAN    DEFAULT FALSE NOT NULL              -- if this is set to true, the message will not be displayed in the starboard.
);

CREATE TABLE IF NOT EXISTS starboard_entries (
    msg_id            BIGINT      PRIMARY KEY,
    bot_message_id    BIGINT,
    channel           BIGINT,
    stars             INT         NOT NULL,
    bot_content_id    BIGINT      NOT NULL DEFAULT 0
);


CREATE TABLE IF NOT EXISTS starers (
    user_id         BIGINT,
    msg_id          BIGINT
)

CREATE TABLE IF NOT EXISTS reminders (
	reminder_uid 		SERIAL 			PRIMARY KEY, -- (pk)
	user_id 		BIGINT			NOT NULL,
	guild_id		BIGINT 			NOT NULL,
	channel_id 		BIGINT 			NOT NULL,
	created_at 		TIMESTAMP 		DEFAULT (now() at time zone 'utc'),
	expires_on 		TIMESTAMP,
	user_message 		VARCHAR(100) 		-- This should be enough.
);

DELETE FROM reminders WHERE expires_on < now()
