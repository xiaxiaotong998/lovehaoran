<div class="card">
    <div class="card-header">
        Author
    </div>
    <div class="card-body">
        <div class="media">
            <a href="/user/${topicUser.username}" class="mr-3">
                <img src="${topicUser.avatar!}" title="${topicUser.username}" class="avatar"/>
            </a>
            <div class="media-body">
                <div class="media-heading">
                    <a href="/user/${topicUser.username!}">${topicUser.username}</a>
                </div>
                <p>Score：${topicUser.score}</p>
            </div>
        </div>
        <div style="color: #7A7A7A; font-size: 12px;margin-top:5px;">
            <i>${(topicUser.bio!"This guy is lazy, he left nothing")?html}</i>
        </div>
    </div>
</div>
